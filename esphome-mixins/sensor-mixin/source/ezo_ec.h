// https://www.atlas-scientific.com/product_pages/circuits/ezo_ec.html

#include "esphome.h"
#include "Ezo_i2c.h"
#include <string>
#include <algorithm>

class EzoEcSensor : public PollingComponent
{
public:
    Sensor* ec_sensor = new Sensor();
    Sensor* tds_sensor = new Sensor();
    Sensor* s_sensor = new Sensor();
    Sensor* sg_sensor = new Sensor();

private:
    Ezo_board* EC;
    float ec_value;
    float ec_data[4];
    const static uint8_t ec_data_raw_len = 32;
    char ec_data_raw[ec_data_raw_len];
    uint32_t next_poll_time = 0;                                //holds the next time we receive a response, in milliseconds
    bool reading_request_phase = true;                          //selects our phase
    const unsigned int response_delay = 1000;                   //how long we wait to receive a response, in milliseconds

public:
    EzoEcSensor(int update_interval, uint8_t address = 100) : PollingComponent(update_interval)
    {
        EC = new Ezo_board(address, "EC");
    }

    enum ec_data_type {ELECTRICAL_CONDUCTIVITY, TOTAL_DISOLVED_SOLIDS, SALANITY, SPEC_GRAV_SEA_WATER};

    void update() override 
    {
        if (reading_request_phase) {                            //if were in the phase where we ask for a reading
            EC->send_read_cmd();

            next_poll_time = millis() + response_delay;         //set when the response will arrive
            reading_request_phase = false;                      //switch to the receiving phase
        }
        else {                                                  //if were in the receiving phase
            if (millis() >= next_poll_time) {                   //and its time to get the response
                receive_all_readings();                              //get the reading from the EC circuit
            }

            reading_request_phase = true;                       //switch to the receiving phase
        }
    }

private:
    void receive_reading() {                                    // function to decode the reading after the read command was issued
        EC->receive_read_cmd();                                 //get the response data and put it into the [Sensor].reading variable if successful

        switch (EC->get_error()) {                              //switch case based on what the response code is.
            case Ezo_board::SUCCESS:
                ec_value = EC->get_last_received_reading();     //the command was successful, print the reading
                ESP_LOGD("ezo_ec", "EZO EC sensor measured %.2f uS", ec_value);
                ec_sensor->publish_state(ec_value);
                break;

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

    void receive_all_readings()
    {
        enum Ezo_board::errors error = EC->receive_cmd(ec_data_raw, ec_data_raw_len);

        switch (error) {
            case Ezo_board::SUCCESS:
            {
                char* end;
                std::string s(ec_data_raw);

                replace(s.begin(), s.end(), ',', ' ');

                ec_data[EzoEcSensor::ELECTRICAL_CONDUCTIVITY] = strtof(s.c_str(), &end);
                ec_data[EzoEcSensor::TOTAL_DISOLVED_SOLIDS]   = strtof(end, &end);
                ec_data[EzoEcSensor::SALANITY]                = strtof(end, &end);
                ec_data[EzoEcSensor::SPEC_GRAV_SEA_WATER]     = strtof(end, nullptr);

                ESP_LOGD("ezo_ec", "Got electrical_conductivity=%.2fuS/cm total_dissolved_solids=%.2fppm salinity=%.2fPSU", ec_data[EzoEcSensor::ELECTRICAL_CONDUCTIVITY], ec_data[EzoEcSensor::TOTAL_DISOLVED_SOLIDS], ec_data[EzoEcSensor::SALANITY]);
                // ESP_LOGD("ezo_ec", "EZO EC sensor measured SG = %.2f g/cm3", ec_data[EzoEcSensor::SPEC_GRAV_SEA_WATER]);

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
};
