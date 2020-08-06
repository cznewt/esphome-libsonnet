#include "esphome.h"
#include "Ezo_i2c.h"

class EzoPhSensor : public PollingComponent, public Sensor
{
private:
    Ezo_board* PH;
    float ph_value = 0.0;
    float* temperature;
    float last_temperature = 25.0;
    float temperature_comp_step = 2.0;
    uint32_t next_poll_time = 0;
    const unsigned int response_delay = 1000;
    const unsigned int startup_delay = 10000;
	const static uint8_t bufferlen = 32;
    char buffer[bufferlen];

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
    EzoPhSensor(int update_interval, float* t, uint8_t address);
    void update() override;
};

EzoPhSensor::EzoPhSensor(int update_interval, float* temperature_source = nullptr, uint8_t address = 99) : PollingComponent(update_interval)
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

    PH = new Ezo_board(address, "PH");
}

void EzoPhSensor::update()
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

bool EzoPhSensor::is_compensation_valid(float current_temperature)
{
    bool valid = true;

    if (abs(current_temperature - last_temperature) >= temperature_comp_step)
    {
        ESP_LOGD("ezo_ph", "Update temperature compensation");
        last_temperature = current_temperature;
        state = TEMPERATURE_COMP;
        valid = false;
    }

    return valid;
}
bool EzoPhSensor::set_temperature_comp()
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
            ESP_LOGD("ezo_ph", "Set temperature compensation for: %.2fC", *temperature);
            PH->send_cmd_with_num("T,", *temperature, 2);
            next_poll_time = millis() + response_delay;

            tc_step = CHECK_VALUE;
        }
        else if (tc_step == CHECK_VALUE)
        {
            if (millis() >= next_poll_time)
            {
                ESP_LOGD("ezo_ph", "Check temperature compensation");
                PH->send_cmd("T,?");
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

            PH->receive_cmd(buffer, bufferlen);

            if (PH->get_error() != Ezo_board::SUCCESS)
            {
                ESP_LOGE("ezo_ph", "Communication error in check temperature compensation");
            }
            else
            {
                String response(buffer);
                //Check if value is valid
                if((response == "?T,0.00") || (response == ""))
                {
                    ESP_LOGD("ezo_ph", "Read compensation value is not valid - repeat setting it");
                }
                else
                {
                    ESP_LOGD("ezo_ph", "Read compensation value: %s",buffer);
                    finished = true;
                }
            }

            tc_step = SEND_VALUE;
            tx_state = SEND_COMMAND;
        }
    }

    return finished;
}

bool EzoPhSensor::check_firmware_ver()
{
    bool finished = false;

    if (tx_state == SEND_COMMAND)
    {
            PH->send_cmd("i");
            ESP_LOGD("ezo_ph", "Check firmware version");
            next_poll_time = millis() + response_delay;

            tx_state = RECEIVE_RESPONSE;
    }
    else if (tx_state == RECEIVE_RESPONSE)
    {
        if (millis() >= next_poll_time) {
            memset(buffer, 0, bufferlen);

            PH->receive_cmd(buffer, bufferlen);

            if (PH->get_error() != Ezo_board::SUCCESS)
            {
                ESP_LOGE("ezo_ph", "Communication error in check firmware version");
            }
            else
            {
                ESP_LOGD("ezo_ph", "Read firmware value: %s",buffer);
                finished = true;
            }
            tx_state = SEND_COMMAND;
        }
    }

    return finished;
}

bool EzoPhSensor::check_calibration()
{
    bool finished = false;

    if (tx_state == SEND_COMMAND)
    {
            ESP_LOGD("ezo_ph", "Check calibration");
            PH->send_cmd("cal,?");
            next_poll_time = millis() + response_delay;

            tx_state = RECEIVE_RESPONSE;
    }
    else if (tx_state == RECEIVE_RESPONSE)
    {
        if (millis() >= next_poll_time) {
            memset(buffer, 0, bufferlen);

            PH->receive_cmd(buffer, bufferlen);

            if (PH->get_error() != Ezo_board::SUCCESS)
            {
                ESP_LOGE("ezo_ph", "Communication error in check calibration");
            }
            else
            {
                ESP_LOGD("ezo_ph", "Read calibration value: %s",buffer);
                finished = true;
            }
            tx_state = SEND_COMMAND;
        }
    }

    return finished;
}

void EzoPhSensor::measure()
{
    if (tx_state == SEND_COMMAND)
    {
        if (is_compensation_valid(*temperature))
        {
            PH->send_read_cmd();
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

void EzoPhSensor::receive_reading()
{
    PH->receive_read_cmd();

    switch (PH->get_error())
    {
        case Ezo_board::SUCCESS:
            ph_value = PH->get_last_received_reading();
            ESP_LOGD("ezo_ph", "EZO pH sensor measured %.2f ph", ph_value);

            publish_state(ph_value);
            break;

        case Ezo_board::FAIL:
            ESP_LOGE("ezo_ph", "EZO pH sensor reading has failed");
            break;

        case Ezo_board::NOT_READY:
            ESP_LOGE("ezo_ph", "EZO pH sensor has not yet been finished calculating");
            break;

        case Ezo_board::NO_DATA:
            ESP_LOGE("ezo_ph", "EZO pH sensor returned no data");
            break;

        case Ezo_board::NOT_READ_CMD:
            ESP_LOGE("ezo_ph", "Command is not READ");
            break;
    }
}
