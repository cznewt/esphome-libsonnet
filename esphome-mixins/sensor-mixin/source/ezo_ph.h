#include "esphome.h"
#include "Ezo_i2c.h"

class EzoPhSensor : public PollingComponent, public Sensor
{
private:
    Ezo_board* PH;
    float ph_value = 0.0;
    uint32_t next_poll_time = 0;                                //holds the next time we receive a response, in milliseconds
    bool reading_request_phase = true;                          //selects our phase
    const unsigned int response_delay = 1000;                   //how long we wait to receive a response, in milliseconds

public:
    EzoPhSensor(int update_interval, uint8_t address = 99) : PollingComponent(update_interval)
    {
        PH = new Ezo_board(address, "PH");
    }

    void update() override 
    {
        if (reading_request_phase) {                            //if were in the phase where we ask for a reading
            PH->send_read_cmd();

            next_poll_time = millis() + response_delay;         //set when the response will arrive
            reading_request_phase = false;                      //switch to the receiving phase
        }
        else {                                                  //if were in the receiving phase
            if (millis() >= next_poll_time) {                   //and its time to get the response
                receive_reading();                              //get the reading from the PH circuit
            }

            reading_request_phase = true;                       //switch to the receiving phase
        }
    }

private:
    void receive_reading() {                                    // function to decode the reading after the read command was issued
        PH->receive_read_cmd();                                 //get the response data and put it into the [Sensor].reading variable if successful

        switch (PH->get_error()) {                              //switch case based on what the response code is.
            case Ezo_board::SUCCESS:
                ph_value = PH->get_last_received_reading();     //the command was successful, print the reading
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
};
;
