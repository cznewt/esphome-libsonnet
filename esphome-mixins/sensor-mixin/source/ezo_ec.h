// https://www.atlas-scientific.com/product_pages/circuits/ezo_ec.html

#include "esphome.h"
#include "Ezo_i2c.h"
#include <string>
#include <algorithm>

class EzoEcSensor : public PollingComponent
{
private:
    Ezo_board* EC;
    float ec_value;
    float ec_data[4];
    float* temperature;
    float last_temperature = 25.0;
    float temperature_comp_step = 2.0;
    uint32_t next_poll_time = 0;                                //holds the next time we receive a response, in milliseconds
    const unsigned int response_delay = 1000;                   //how long we wait to receive a response, in milliseconds
    const unsigned int startup_delay = 10000;
	const static uint8_t bufferlen = 32;
    char buffer[bufferlen];

    enum EcData {ELECTRICAL_CONDUCTIVITY, TOTAL_DISOLVED_SOLIDS, SALANITY, SPEC_GRAV_SEA_WATER};

    enum MeasurementState
    {
        WAIT_AFTER_STARTUP,
        CHECK_FIRMWARE_VER,
        CHECK_CALIBRATION,
        VALIDATE_EXTERNALS,
        TEMPERATURE_COMP, 
        MEASURE
    };

    enum TransferState
    {
        SEND_COMMAND,
        RECEIVE_RESPONSE
    };

    MeasurementState    state;
    TransferState       tx_state;

    bool is_compensation_valid(float current_temperature);
    bool set_temperature_comp();
    bool check_firmware_ver();
    bool check_calibration();
    void measure();
    void receive_reading();

public:
    Sensor* ec_sensor = new Sensor();
    Sensor* tds_sensor = new Sensor();
    Sensor* s_sensor = new Sensor();
    Sensor* sg_sensor = new Sensor();

    EzoEcSensor(int update_interval, float* temperature_source, uint8_t address);
    void update() override;
};

EzoEcSensor::EzoEcSensor(int update_interval, float* temperature_source = nullptr, uint8_t address = 100) : PollingComponent(update_interval)
{
    state = WAIT_AFTER_STARTUP;
    tx_state = SEND_COMMAND;
    //set duration of WAIT_AFTER_STARTUP state
    next_poll_time = millis() + startup_delay;

    if (temperature_source == nullptr)
        //Ensure valid temperature value in case of missing temperature value source 
        temperature = &last_temperature;
    else
        //Save pointer to global value defined in yaml that stores temperature sensor value
        temperature = temperature_source;

    EC = new Ezo_board(address, "EC");
}

void EzoEcSensor::update()
{
    if (state == MEASURE)
    {
        measure();
    }
    else if (state == TEMPERATURE_COMP)
    {
        if (set_temperature_comp() == true)
            state = MEASURE;
    }
    else if (state == CHECK_FIRMWARE_VER)
    {
        if (check_firmware_ver() == true)
            state = CHECK_CALIBRATION;
    }
    else if (state == CHECK_CALIBRATION)
    {
        if (check_calibration() == true)
            state = VALIDATE_EXTERNALS;
    }
    else if (state == VALIDATE_EXTERNALS)
    {
        if (*temperature != -274.0)
            state = MEASURE;
    }
    else if (state == WAIT_AFTER_STARTUP)
    {
        if (millis() >= next_poll_time) 
            state = CHECK_FIRMWARE_VER;
    }
}

bool EzoEcSensor::is_compensation_valid(float current_temperature)
{
    bool valid = true;

    if (abs(current_temperature - last_temperature) >= temperature_comp_step)
    {
        ESP_LOGD("ezo_ec", "Update temperature compensation");
        last_temperature = current_temperature;
        state = TEMPERATURE_COMP;
        valid = false;
    }

    return valid;
}
bool EzoEcSensor::set_temperature_comp()
{
    enum step
    {
        SEND_VALUE,
        CHECK_VALUE
    }; 
    static step tc_step = SEND_VALUE;
    bool finished = false;

    if (tx_state == SEND_COMMAND)
    {
        if (tc_step == SEND_VALUE)
        {
            ESP_LOGD("ezo_ec", "Set temperature compensation for: %.2fC", *temperature);
            EC->send_cmd_with_num("T,", *temperature, 2);
            next_poll_time = millis() + response_delay;

            tc_step = CHECK_VALUE;
        }
        else if (tc_step == CHECK_VALUE)
        {
            if (millis() >= next_poll_time)
            {
                ESP_LOGD("ezo_ec", "Check temperature compensation");
                EC->send_cmd("T,?");
                next_poll_time = millis() + response_delay;

                tx_state = RECEIVE_RESPONSE;
            }
        }
    }
    else if (tx_state == RECEIVE_RESPONSE)
    {
        if (millis() >= next_poll_time)
        {
            memset(buffer, 0, bufferlen);

            EC->receive_cmd(buffer, bufferlen);

            if (EC->get_error() != Ezo_board::SUCCESS)
            {
                ESP_LOGE("ezo_ec", "Communication error in check temperature compensation");
            }
            else
            {
                String response(buffer);
                //Check if value is valid
                if((response == "?T,0.00") || (response == ""))
                {
                    ESP_LOGD("ezo_ec", "Read compensation value is not valid - repeat setting it");
                }
                else
                {
                    ESP_LOGD("ezo_ec", "Read compensation value: %s",buffer);
                    finished = true;
                }
            }

            tc_step = SEND_VALUE;
            tx_state = SEND_COMMAND;
        }
    }

    return finished;
}

bool EzoEcSensor::check_firmware_ver()
{
    bool finished = false;

    if (tx_state == SEND_COMMAND)
    {
            EC->send_cmd("I");
            ESP_LOGD("ezo_ec", "Check firmware version");
            next_poll_time = millis() + response_delay;

            tx_state = RECEIVE_RESPONSE;
    }
    else if (tx_state == RECEIVE_RESPONSE)
    {
        if (millis() >= next_poll_time) {
            memset(buffer, 0, bufferlen);

            EC->receive_cmd(buffer, bufferlen);

            if (EC->get_error() != Ezo_board::SUCCESS)
            {
                ESP_LOGE("ezo_ec", "Communication error in check firmware version");
            }
            else
            {
                ESP_LOGD("ezo_ec", "Read firmware value: %s",buffer);
                finished = true;
            }
            tx_state = SEND_COMMAND;
        }
    }

    return finished;
}

bool EzoEcSensor::check_calibration()
{
    bool finished = false;

    if (tx_state == SEND_COMMAND)
    {
            ESP_LOGD("ezo_ec", "Check calibration");
            EC->send_cmd("cal,?");
            next_poll_time = millis() + response_delay;

            tx_state = RECEIVE_RESPONSE;
    }
    else if (tx_state == RECEIVE_RESPONSE)
    {
        if (millis() >= next_poll_time) {
            memset(buffer, 0, bufferlen);

            EC->receive_cmd(buffer, bufferlen);

            if (EC->get_error() != Ezo_board::SUCCESS)
            {
                ESP_LOGE("ezo_ec", "Communication error in check calibration");
            }
            else
            {
                ESP_LOGD("ezo_ec", "Read calibration value: %s",buffer);
                finished = true;
            }
            tx_state = SEND_COMMAND;
        }
    }

    return finished;
}

void EzoEcSensor::measure()
{
    if (tx_state == SEND_COMMAND)
    {
        if (is_compensation_valid(*temperature))
        {
            EC->send_read_cmd();
            next_poll_time = millis() + response_delay;
            tx_state = RECEIVE_RESPONSE;
        }
    }
    else if (tx_state == RECEIVE_RESPONSE)
    {
        if (millis() >= next_poll_time)
        {
            receive_reading();
            tx_state = SEND_COMMAND;
        }
    }
}

void EzoEcSensor::receive_reading()
{
	//enum Ezo_board::errors error = EC->receive_cmd(buffer, bufferlen);
	EC->receive_cmd(buffer, bufferlen);

    switch (EC->get_error()) {
        case Ezo_board::SUCCESS:
        {
            char* end;
            std::string s(buffer);

            replace(s.begin(), s.end(), ',', ' ');

	        ec_data[EzoEcSensor::ELECTRICAL_CONDUCTIVITY] = strtof(s.c_str(), &end);
	        ec_data[EzoEcSensor::TOTAL_DISOLVED_SOLIDS]   = strtof(end, &end);
	        ec_data[EzoEcSensor::SALANITY]                = strtof(end, &end);
            ec_data[EzoEcSensor::SPEC_GRAV_SEA_WATER]     = strtof(end, nullptr);

            ESP_LOGD("ezo_ec", "Got electrical_conductivity=%.2fuS/cm total_dissolved_solids=%.2fppm salinity=%.2fPSU", ec_data[EzoEcSensor::ELECTRICAL_CONDUCTIVITY], ec_data[EzoEcSensor::TOTAL_DISOLVED_SOLIDS], ec_data[EzoEcSensor::SALANITY]);

            ec_sensor->publish_state(ec_data[EzoEcSensor::ELECTRICAL_CONDUCTIVITY]);
            tds_sensor->publish_state(ec_data[EzoEcSensor::TOTAL_DISOLVED_SOLIDS]);
            s_sensor->publish_state(ec_data[EzoEcSensor::SALANITY]);
            sg_sensor->publish_state(ec_data[EzoEcSensor::SPEC_GRAV_SEA_WATER]);
            break;
        }

        case Ezo_board::FAIL:
            ESP_LOGE("ezo_ec", "EZO EC sensor reading has failed");
            break;

        case Ezo_board::NOT_READY:
            ESP_LOGE("ezo_ec", "EZO EC sensor has not yet been finished calculating");
            break;

        case Ezo_board::NO_DATA:
            ESP_LOGE("ezo_ec", "EZO EC sensor returned no data");
            break;

        case Ezo_board::NOT_READ_CMD:
            ESP_LOGE("ezo_ec", "Command is not READ");
            break;
    }
}
