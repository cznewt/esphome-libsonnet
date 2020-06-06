#include "esphome.h"
#include "Adafruit_TSL2591.h"

// https://github.com/esphome/feature-requests/issues/267

class Tsl2591Sensor : public PollingComponent, public Sensor
{
public:
    Tsl2591Sensor(int update_interval) : PollingComponent(update_interval) {}
    Adafruit_TSL2591 tsl = Adafruit_TSL2591(2591);
    int update_interval;

    void setup() override
    {
        if (!tsl.begin())
        {
            ESP_LOGD("tsl2591", "Could not find a TSL2591 Sensor");
        }
        tsl.setGain(TSL2591_GAIN_LOW);
        tsl.setTiming(TSL2591_INTEGRATIONTIME_600MS);
    }

    void update() override
    {
        uint16_t illumination = tsl.getLuminosity(TSL2591_VISIBLE);
        ESP_LOGD("tsl2591", "Got illuminance=%.2flx", float(illumination));
        publish_state(illumination);
    }
};
