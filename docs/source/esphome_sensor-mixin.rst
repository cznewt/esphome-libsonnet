==============================================================
sensor-mixin
==============================================================

Text Sensor Parameters (Partial)
==============================================================



Configuration parameters
--------------------------------------------------------------

* **icon**: Icon to use for the sensor in the frontend.
* **internal**: Mark this component as internal. Internal components will not be exposed to the frontend (like Home Assistant).
* **on_value**: (optional, automation) An automation to perform when a new value is published.


Binary Sensor Parameters (Partial)
==============================================================



Configuration parameters
--------------------------------------------------------------

* **device_class**: The device class for the sensor. See https://www.home-assistant.io/components/binary_sensor/ for a list of available options.
* **internal**: Mark this component as internal. Internal components will not be exposed to the frontend (like Home Assistant).
* **on_press**: (optional, automation) An automation to perform when the button is pressed.
* **on_release**: (optional, automation) An automation to perform when the button is released.


Numeric Sensor Parameters (Partial)
==============================================================



Configuration parameters
--------------------------------------------------------------

* **unit_of_measurement**: (optional, string) Unit of measurement the sensor should advertise its values with.
* **icon**: Icon to use for the sensor in the frontend.
* **accuracy_decimals**: (optional, int) Accuracy of decimals to use when reporting values.
* **expire_after**: Time in which the sensor values should be marked as “expired”.
* **filters**: Filters to use for some basic transforming of values.
* **internal**: Mark this component as internal. Internal components will not be exposed to the frontend (like Home Assistant).
* **on_value**: (optional, automation) An automation to perform when a new value is published.
* **on_value_range**: (optional, automation) An automation to perform when a published value transition from outside to a range to inside.
* **on_raw_value**: (optional, automation) An automation to perform when a raw value is received that hasn’t passed through any filters.


Numeric Polling Sensor Parameters (Partial)
==============================================================



Configuration parameters
--------------------------------------------------------------

* **update_interval**: (optional, string) The interval to check the sensor. Defaults to `60s`.
* **unit_of_measurement**: (optional, string) Unit of measurement the sensor should advertise its values with.
* **icon**: Icon to use for the sensor in the frontend.
* **accuracy_decimals**: (optional, int) Accuracy of decimals to use when reporting values.
* **expire_after**: Time in which the sensor values should be marked as “expired”.
* **filters**: Filters to use for some basic transforming of values.
* **on_value**: (optional, automation) An automation to perform when a new value is published.
* **on_value_range**: (optional, automation) An automation to perform when a published value transition from outside to a range to inside.
* **on_raw_value**: (optional, automation) An automation to perform when a raw value is received that hasn’t passed through any filters.


I²C Device Parameters (Partial)
==============================================================



Configuration parameters
--------------------------------------------------------------

* **bus**: ID for this I²C bus if you need multiple I²C buses. Defaults to `i2c_1`.
* **address**: I²C address of the sensor.


ADC Analog To Digital Sensor
==============================================================

The Analog To Digital sensor allows you to use the built-in ADC in your device to measurea voltage on certain pins. On the ESP8266 only pin `A0` (`GPIO17`) supports this. On the ESP32pins `GPIO32` through `GPIO39` can be used.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/adc.html <https://esphome.io/components/sensor/adc.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the voltage sensor.
* **pin**: (required) The pin to measure the voltage on. Or on the ESP8266 alternatively also `VCC`.
* **attenuation**: Specify the ADC attenuation to use. Only on ESP32.


Sample configurations
--------------------------------------------------------------

adc_sensor_chip_vcc
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/adc_sensor/source/adc_sensor_chip_vcc.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/adc_sensor/render/adc_sensor_chip_vcc.yaml
   :language: yaml
   :linenos:

adc_sensor_multiply_filter
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/adc_sensor/source/adc_sensor_multiply_filter.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/adc_sensor/render/adc_sensor_multiply_filter.yaml
   :language: yaml
   :linenos:

adc_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/adc_sensor/source/adc_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/adc_sensor/render/adc_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

AJ-SR04M Ultrasonic Distance Sensor
==============================================================

.. image:: /static/img/aj-sr04m.jpg
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/ultrasonic.html <https://esphome.io/components/sensor/ultrasonic.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the distance sensor.
* **trigger_pin**: (required) The output pin to periodically send the trigger pulse to.
* **echo_pin**: (required) The input pin on which to wait for the echo.


Sample configurations
--------------------------------------------------------------

aj_sr04m_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/aj_sr04m_sensor/source/aj_sr04m_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/aj_sr04m_sensor/render/aj_sr04m_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

AM2302 Humidity and Temperature Sensor
==============================================================

.. image:: /static/img/am2302.jpg
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/dht.html <https://esphome.io/components/sensor/dht.html>`_
* **datasheet**: `https://cdn-shop.adafruit.com/datasheets/Digital+humidity+and+temperature+sensor+AM2302.pdf <https://cdn-shop.adafruit.com/datasheets/Digital+humidity+and+temperature+sensor+AM2302.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **pin**: (required) The pin where the DHT bus is connected.


Sample configurations
--------------------------------------------------------------

am2302_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/am2302_sensor/source/am2302_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/am2302_sensor/render/am2302_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

AM2320 Temperature and Humidity Sensor
==============================================================

.. image:: /static/img/am2320.jpg
   :width: 45%

The AM2320 is effectively the latest version of the AM2302 with the addition of an option to communicate over I2C interface. It is physically a little smaller, but with identical pin-out. The one-wire serial of the AM2302 is retained making this a simple drop-in replacement.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/am2320.html <https://esphome.io/components/sensor/am2320.html>`_
* **datasheet**: `https://akizukidenshi.com/download/ds/aosong/AM2320.pdf <https://akizukidenshi.com/download/ds/aosong/AM2320.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x40`.


Sample configurations
--------------------------------------------------------------

am2320_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/am2320_sensor/source/am2320_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/am2320_sensor/render/am2320_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

BH1750 Ambient Light Sensor
==============================================================

.. image:: /static/img/bh1750.jpg
   :width: 45%

Power supply: 3~5V; Data range: 0-65535; Sensor built-in and 16bitAD converter; Direct digital output, bypassing the complicated calculation, omit calibration; Do not distinguish between ambient light; Close to the visual sensitivity of spectral characteristics; For a wide range of brightness for 1 lux high precision measurement.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/bh1750.html <https://esphome.io/components/sensor/bh1750.html>`_
* **datasheet**: `http://www.mouser.com/ds/2/348/bh1750fvi-e-186247.pdf <http://www.mouser.com/ds/2/348/bh1750fvi-e-186247.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the light sensor.
* **resolution**: The resolution of the sensor in lx. One of `4.0`, `1.0`, `0.5`. Defaults to `0.5` (the maximum resolution).
* **address**: I²C address of the sensor. Defaults to `0x23` (address if address pin is pulled low). If the address pin is pulled high, the address is `0x5C`.


Sample configurations
--------------------------------------------------------------

bh1750_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/bh1750_sensor/source/bh1750_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/bh1750_sensor/render/bh1750_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

CCS811 CO₂ and Volatile Organic Compound Sensor
==============================================================

.. image:: /static/img/ccs811.png
   :width: 45%

.. image:: /static/img/ccs811-alt.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/ccs811.html <https://esphome.io/components/sensor/ccs811.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x5A`.


Sample configurations
--------------------------------------------------------------

ccs811_sensor_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ccs811_sensor/source/ccs811_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ccs811_sensor/render/ccs811_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

ccs811_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ccs811_sensor/source/ccs811_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ccs811_sensor/render/ccs811_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

DS18B20 Temperature Sensor
==============================================================

.. image:: /static/img/ds18b20.png
   :width: 45%

.. image:: /static/img/ds18b20-wp.png
   :width: 45%

The DS18B20 is a rather useful sensor because you can read more than one of them using the same GPIO pin. Device is able to recognise the input from each separate sensor.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/dallas.html <https://esphome.io/components/sensor/dallas.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: (required, int) The address of the sensor.
* **bus**: (optional, id) The ID of the dallas hub. Use this if you have multiple dallas hubs.
* **resolution**: (optional, int) An optional resolution from `8` to `12`. Higher means more accurate. Defaults to the maximum for most Dallas temperature sensors: `12`.


Sample configurations
--------------------------------------------------------------

dallas_ds18_sensor_multiple_buses
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/dallas_ds18_sensor/source/dallas_ds18_sensor_multiple_buses.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/dallas_ds18_sensor/render/dallas_ds18_sensor_multiple_buses.yaml
   :language: yaml
   :linenos:

dallas_ds18_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/dallas_ds18_sensor/source/dallas_ds18_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/dallas_ds18_sensor/render/dallas_ds18_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

dallas_ds18_sensor_multiple_sensors
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/dallas_ds18_sensor/source/dallas_ds18_sensor_multiple_sensors.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/dallas_ds18_sensor/render/dallas_ds18_sensor_multiple_sensors.yaml
   :language: yaml
   :linenos:

DHT11 Humidity and Temperature Sensor
==============================================================

.. image:: /static/img/dht11.jpg
   :width: 45%

The DHT11 is a basic, ultra low-cost digital temperature and humidity sensor. It uses a capacitive humidity sensor and a thermistor to measure the surrounding air, and spits out a digital signal on the data pin (no analog input pins needed). Its fairly simple to use, but requires careful timing to grab data. The only real downside of this sensor is you can only get new data from it once every 2 seconds, so when using, sensor readings can be up to 2 seconds old.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/dht.html <https://esphome.io/components/sensor/dht.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **pin**: (required) The pin where the DHT bus is connected.


Sample configurations
--------------------------------------------------------------

dht11_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/dht11_sensor/source/dht11_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/dht11_sensor/render/dht11_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

DHT22 Humidity and Temperature Sensor
==============================================================

.. image:: /static/img/dht22.jpg
   :width: 45%

The DHT22 is a basic, low-cost digital temperature and humidity sensor. It uses a capacitive humidity sensor and a thermistor to measure the surrounding air, and spits out a digital signal on the data pin (no analog input pins needed). Compared to the DHT11, this sensor is more precise, more accurate and works in a bigger range of temperature/humidity, but its larger and more expensive.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/dht.html <https://esphome.io/components/sensor/dht.html>`_
* **datasheet**: `https://www.sparkfun.com/datasheets/Sensors/Temperature/DHT22.pdf <https://www.sparkfun.com/datasheets/Sensors/Temperature/DHT22.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **pin**: (required) The pin where the DHT bus is connected.


Sample configurations
--------------------------------------------------------------

dht22_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/dht22_sensor/source/dht22_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/dht22_sensor/render/dht22_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

Atlas-Scientific EZO Dissolved Oxygen Sensor
==============================================================

.. image:: /static/img/as_do.png
   :width: 45%



More information
--------------------------------------------------------------

* **code**: `https://github.com/Atlas-Scientific/Ezo_I2c_lib <https://github.com/Atlas-Scientific/Ezo_I2c_lib>`_
* **datasheet**: `https://www.atlas-scientific.com/files/DO_EZO_Datasheet.pdf <https://www.atlas-scientific.com/files/DO_EZO_Datasheet.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x63`.


Sample configurations
--------------------------------------------------------------

ezo_do_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ezo_do_sensor/source/ezo_do_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ezo_do_sensor/render/ezo_do_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

Atlas-Scientific EZO EC Sensor
==============================================================

.. image:: /static/img/as_ec_k1.png
   :width: 45%



More information
--------------------------------------------------------------

* **code**: `https://github.com/Atlas-Scientific/Ezo_I2c_lib <https://github.com/Atlas-Scientific/Ezo_I2c_lib>`_
* **datasheet**: `https://www.atlas-scientific.com/files/EC_EZO_Datasheet.pdf <https://www.atlas-scientific.com/files/EC_EZO_Datasheet.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x64`.


Sample configurations
--------------------------------------------------------------

ezo_ec_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ezo_ec_sensor/source/ezo_ec_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ezo_ec_sensor/render/ezo_ec_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

Atlas-Scientific EZO ORP Sensor
==============================================================

.. image:: /static/img/as_orp.jpg
   :width: 45%



More information
--------------------------------------------------------------

* **code**: `https://github.com/Atlas-Scientific/Ezo_I2c_lib <https://github.com/Atlas-Scientific/Ezo_I2c_lib>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x62`.


Sample configurations
--------------------------------------------------------------

ezo_orp_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ezo_orp_sensor/source/ezo_orp_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ezo_orp_sensor/render/ezo_orp_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

Atlas-Scientific EZO pH Sensor
==============================================================

.. image:: /static/img/as_ph.png
   :width: 45%

.. image:: /static/img/as_spear_tip_ph.png
   :width: 45%



More information
--------------------------------------------------------------

* **code**: `https://github.com/Atlas-Scientific/Ezo_I2c_lib <https://github.com/Atlas-Scientific/Ezo_I2c_lib>`_
* **datasheet**: `https://www.atlas-scientific.com/files/pH_EZO_Datasheet.pdf <https://www.atlas-scientific.com/files/pH_EZO_Datasheet.pdf>`_
* **guide**: `https://www.instructables.com/id/UART-AND-I2C-MODE-SWITCHING-FOR-ATLAS-SCIENTIFIC-E/ <https://www.instructables.com/id/UART-AND-I2C-MODE-SWITCHING-FOR-ATLAS-SCIENTIFIC-E/>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x63`.


Sample configurations
--------------------------------------------------------------

ezo_ph_sensor_temp_comp
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ezo_ph_sensor/source/ezo_ph_sensor_temp_comp.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ezo_ph_sensor/render/ezo_ph_sensor_temp_comp.yaml
   :language: yaml
   :linenos:

ezo_ph_sensor_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ezo_ph_sensor/source/ezo_ph_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ezo_ph_sensor/render/ezo_ph_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

ezo_ph_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ezo_ph_sensor/source/ezo_ph_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ezo_ph_sensor/render/ezo_ph_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

GPIO Binary Sensor
==============================================================

.. image:: /static/img/button-01.png
   :width: 45%

.. image:: /static/img/button-02.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/binary_sensor/gpio.html <https://esphome.io/components/binary_sensor/gpio.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the distance sensor.
* **pin**: (required) The pin to periodically check.


Sample configurations
--------------------------------------------------------------

gpio_binary_sensor_debounce_on_filter
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/gpio_binary_sensor/source/gpio_binary_sensor_debounce_on_filter.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/gpio_binary_sensor/render/gpio_binary_sensor_debounce_on_filter.yaml
   :language: yaml
   :linenos:

gpio_binary_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/gpio_binary_sensor/source/gpio_binary_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/gpio_binary_sensor/render/gpio_binary_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

HC-SR04 Ultrasonic Distance Sensor
==============================================================

.. image:: /static/img/hc-sr04.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/ultrasonic.html <https://esphome.io/components/sensor/ultrasonic.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the distance sensor.
* **trigger_pin**: (required) The output pin to periodically send the trigger pulse to.
* **echo_pin**: (required) The input pin on which to wait for the echo.


Sample configurations
--------------------------------------------------------------

sr04_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/hc_sr04_sensor/source/sr04_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/hc_sr04_sensor/render/sr04_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

HDC1080 Temperature and Humidity Sensor
==============================================================

.. image:: /static/img/hdc1080.png
   :width: 45%

This I2C digital humidity sensor is a fairly accurate and intelligent alternative to the much simpler Humidity and Temperature Sensor - SHT15 Breakout It has a typical accuracy of ±4% with an operating range that's optimized from 10% to 80% RH. Operation outside this range is still possible - just the accuracy might drop a bit. The temperature output has a typical accuracy of ±0.2°C from -20~85°C.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/hdc1080.html <https://esphome.io/components/sensor/hdc1080.html>`_
* **datasheet**: `https://www.ti.com/lit/ds/symlink/hdc1080.pdf <https://www.ti.com/lit/ds/symlink/hdc1080.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x40` with possible `0x41`, `0x42` or `0x43`.


Sample configurations
--------------------------------------------------------------

hdc1080_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/hdc1080_sensor/source/hdc1080_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/hdc1080_sensor/render/hdc1080_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

HTU21D Temperature and Humidity Sensor
==============================================================

.. image:: /static/img/htu21d.jpg
   :width: 45%

This I²C digital humidity sensor is an accurate and intelligent alternative to the much simpler Humidity and Temperature Sensor - SHT15 Breakout It has a typical accuracy of ±2% with an operating range that’s optimized from 5% to 95% RH. Operation outside this range is still possible - just the accuracy might drop a bit. The temperature output has an accuracy of ±1°C from -30~90°C.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/htu21d.html <https://esphome.io/components/sensor/htu21d.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x40`.


Sample configurations
--------------------------------------------------------------

htu21d_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/htu21d_sensor/source/htu21d_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/htu21d_sensor/render/htu21d_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

htu21d_sensor_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/htu21d_sensor/source/htu21d_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/htu21d_sensor/render/htu21d_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

INA219 DC Current Sensor
==============================================================

.. image:: /static/img/ina219.jpg
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/ina219.html <https://esphome.io/components/sensor/ina219.html>`_
* **datasheet**: `https://cdn-learn.adafruit.com/downloads/pdf/adafruit-ina219-current-sensor-breakout.pdf <https://cdn-learn.adafruit.com/downloads/pdf/adafruit-ina219-current-sensor-breakout.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x40`.
* **max_voltage**: The maximum bus voltage you are expecting. Defaults to `32V` (the max).
* **max_voltage**: The maximum current you are expecting. Defaults to `3.2A`.


Sample configurations
--------------------------------------------------------------

ina219_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ina219_sensor/source/ina219_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ina219_sensor/render/ina219_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

ina219_sensor_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ina219_sensor/source/ina219_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ina219_sensor/render/ina219_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

MAX6675 K-Type Thermocouple Temperature Sensor
==============================================================

.. image:: /static/img/max6675.png
   :width: 45%

SPI driver for MAX6675 thermocouple temperature sensor.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/max6675.html <https://esphome.io/components/sensor/max6675.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name for the temperature sensor.
* **cs_pin**: (required) The Chip Select pin of the SPI interface.


Sample configurations
--------------------------------------------------------------

max6675_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/max6675_sensor/source/max6675_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/max6675_sensor/render/max6675_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

MCP9808 Temperature Sensor
==============================================================

.. image:: /static/img/mcp9808.jpg
   :width: 45%



Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the temperature sensor.


MH-Z19 CO₂ and Temperature Sensor
==============================================================

.. image:: /static/img/mhz19.png
   :width: 45%

This sensor gives a digital (serial) output of the CO2 concentration in air, in parts-per-million (ppm). It uses the optical measurement principle of measuring CO2, which should be much more accurate than the inexpensive electro-chemical sensors you can find.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/mhz19.html <https://esphome.io/components/sensor/mhz19.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **automatic_baseline_calibration**: MH-Z19 has automatic calibration procedure. The automatic calibration cycle is every 24 hours after powered on. Set this value to false to disable ABC on boot (it’s better if you use sensor indoor). Set this value to `true` to enable ABC on boot.


Sample configurations
--------------------------------------------------------------

mhz19_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/mhz19_sensor/source/mhz19_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/mhz19_sensor/render/mhz19_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

PN532 NFC/RFID Sensor
==============================================================

.. image:: /static/img/pn532.png
   :width: 45%

Using the PN532 binary sensors you can then create individual binary sensors that track if an NFC/RFID tag is currently detected by the PN532.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/binary_sensor/pn532.html <https://esphome.io/components/binary_sensor/pn532.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the RDIF sensor.
* **cs_pin**: (required) The pin on the ESP that the chip select line is connected to.
* **on_tag**: An automation to perform when a tag is read.
* **tags.name**: (required) The name of the RDIF tag.
* **tags.uid**: (required) The name of the RDIF tag.


Sample configurations
--------------------------------------------------------------

pn532_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/pn532_sensor/source/pn532_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/pn532_sensor/render/pn532_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

Rotary Encoder Sensor
==============================================================

.. image:: /static/img/rotary_encoder.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/rotary_encoder.html <https://esphome.io/components/sensor/rotary_encoder.html>`_
* **guide**: `https://playground.arduino.cc/Main/RotaryEncoders/ <https://playground.arduino.cc/Main/RotaryEncoders/>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **pin_a**: (required) The first pin for determining the step value. Must not be a pin from an external I/O expander.
* **pin_b**: (required) The second pin for determining the step value. Must not be a pin from an external I/O expander.
* **pin_reset**: An optional pin that resets the step value. This is useful with rotary encoders that have have a third pin. Defaults to no reset pin.
* **resolution**: The resolution of the sensor, this controls how many pulses are generated by one step: `1` (default), `2` and `4`.
* **min_value**: The minimum value this rotary encoder will go to, turning the knob further will not decrease the number. Defaults to no minimum.
* **max_value**: The maximum value this rotary encoder will go to, turning the knob further will not increase the number. Defaults to no maximum.


Sample configurations
--------------------------------------------------------------

rotary_encoder_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/rotary_encoder_sensor/source/rotary_encoder_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/rotary_encoder_sensor/render/rotary_encoder_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

rotary_encoder_sensor_advanced_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/rotary_encoder_sensor/source/rotary_encoder_sensor_advanced_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/rotary_encoder_sensor/render/rotary_encoder_sensor_advanced_esp8266.yaml
   :language: yaml
   :linenos:

SCD30 CO₂, Temperature and Humidity Sensor
==============================================================

.. image:: /static/img/sdc30.png
   :width: 45%

Sensirion SCD30 Sensor Module uses NDIR CO2 sensor technology to sense CO2 and has an integrated temperature and humidity sensor. Ambient humidity and temperature can be measured by monitoring and compensating of external heat sources without the need for additional components. The small module height allows easy integration into different applications. The SCD30 features dual-channel detection for superior stability and ±30ppm + 3% accuracy.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/scd30.html <https://esphome.io/components/sensor/scd30.html>`_
* **datasheet**: `https://www.mouser.com/pdfDocs/Sensirion_CO2_Sensors_SCD30_Datasheet1.pdf <https://www.mouser.com/pdfDocs/Sensirion_CO2_Sensors_SCD30_Datasheet1.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x61`.


Sample configurations
--------------------------------------------------------------

scd30_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/scd30_sensor/source/scd30_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/scd30_sensor/render/scd30_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

scd30_sensor_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/scd30_sensor/source/scd30_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/scd30_sensor/render/scd30_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

SDS011 Particulate Matter Sensor
==============================================================

.. image:: /static/img/sds011.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/sds011.html <https://esphome.io/components/sensor/sds011.html>`_
* **datasheet**: `https://nettigo.pl/attachments/398 <https://nettigo.pl/attachments/398>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.


Sample configurations
--------------------------------------------------------------

sds011_sensor_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/sds011_sensor/source/sds011_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/sds011_sensor/render/sds011_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

sds011_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/sds011_sensor/source/sds011_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/sds011_sensor/render/sds011_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

SGP30 CO₂ and Volatile Organic Compound Sensor
==============================================================

.. image:: /static/img/sgp30.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/sgp30.html <https://esphome.io/components/sensor/sgp30.html>`_
* **datasheet**: `https://www.mouser.com/pdfdocs/Sensirion_Gas_Sensors_SGP30_Datasheet_EN-1148053.pdf <https://www.mouser.com/pdfdocs/Sensirion_Gas_Sensors_SGP30_Datasheet_EN-1148053.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x58`.


Sample configurations
--------------------------------------------------------------

sgp30_sensor_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/sgp30_sensor/source/sgp30_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/sgp30_sensor/render/sgp30_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

sgp30_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/sgp30_sensor/source/sgp30_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/sgp30_sensor/render/sgp30_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

SHT3X-D Temperature and Humidity Sensor
==============================================================

.. image:: /static/img/sht3x.jpg
   :width: 45%

Sensirion Temperature/Humidity sensors are some of the finest & highest-accuracy devices you can get. And, finally we have some that have a true I2C interface for easy reading. The SHT31-D sensor has an excellent ±2% relative humidity and ±0.3°C accuracy for most uses. We now use the version with a PTFE filter, it'll stay clean while still allowing humidity measurements to work.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/sht3xd.html <https://esphome.io/components/sensor/sht3xd.html>`_
* **datasheet**: `https://cdn-shop.adafruit.com/product-files/2857/Sensirion_Humidity_SHT3x_Datasheet_digital-767294.pdf <https://cdn-shop.adafruit.com/product-files/2857/Sensirion_Humidity_SHT3x_Datasheet_digital-767294.pdf>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **address**: I²C address of the sensor. Defaults to `0x44` or optinal `0x45`.


Sample configurations
--------------------------------------------------------------

sht3x_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/sht3x_sensor/source/sht3x_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/sht3x_sensor/render/sht3x_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

SPW2430 MEMS Sound Sensor
==============================================================

.. image:: /static/img/spw2430.jpg
   :width: 45%

The SPW2430 is a small, low cost MEMS mic with a range of 100Hz - 10KHz, good for just about all general audio recording/detection. The output peak-to-peak voltage has a 0.67V DC bias and about 100mVpp (peak-to-peak) when talking near the microphone, which is good for attaching to something that expects 'line level' input without clipping. The peak-to-peak can be as high as 1Vpp if there's a very loud sound.

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **pin**: (required) The pin to measure the voltage on.
* **attenuation**: Specify the ADC attenuation to use. Only on ESP32.


Sample configurations
--------------------------------------------------------------

spw2430_sensor_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/spw2430_sensor/source/spw2430_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/spw2430_sensor/render/spw2430_sensor_basic_esp32.yaml
   :language: yaml
   :linenos:

TEMT6000 Ambient Light Sensor
==============================================================

.. image:: /static/img/temt6000.png
   :width: 45%

The TEMT6000 is a simple and cheap ambient light sensor. The sensor itself changes its resistance based on how much light hits the sensor.

More information
--------------------------------------------------------------

* **documentation**: `https://next.esphome.io/cookbook/temt6000.html <https://next.esphome.io/cookbook/temt6000.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the sensor.
* **pin**: (required) The pin to measure the voltage on.


TSL2561 Ambient Light Sensor
==============================================================

.. image:: /static/img/tls2561.jpg
   :width: 45%

The TSL2561 luminosity sensor is an advanced digital light sensor, ideal for use in a wide range of light situations. Compared to low cost CdS cells, this sensor is more precise, allowing for exact lux calculations and can be configured for different gain/timing ranges to detect light ranges from up to 0.1 - 40,000+ Lux on the fly. The best part of this sensor is that it contains both infrared and full spectrum diodes! That means you can separately measure infrared, full-spectrum or human-visible light. Most sensors can only detect one or the other, which does not accurately represent what human eyes see (since we cannot perceive the IR light that is detected by most photo diodes).

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/tsl2561.html <https://esphome.io/components/sensor/tsl2561.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the light sensor.
* **integration_time**: (optional, time) The time the sensor will take for each measurement. Longer means more accurate values. One of `14ms`, `101ms`, `402ms`. Defaults to `402ms`.
* **gain**: (optional, string) The gain of the sensor. Higher values are better in low-light conditions. One of `1x` and `16x`. Defaults to `1x`.
* **is_cs_package**: (optional, boolean) The “CS” package of this sensor has a slightly different formula for calculating the illuminance in lx. Set to `true` if you’re working with a CS package. Defaults to `false`.
* **address**: I²C address of the sensor. Defaults to `0x39`.


Sample configurations
--------------------------------------------------------------

tsl2561_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/tsl2561_sensor/source/tsl2561_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/tsl2561_sensor/render/tsl2561_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

TSL2591 Ambient Light Sensor
==============================================================

.. image:: /static/img/tls2591.jpg
   :width: 45%

The TSL2591 luminosity sensor is an advanced digital light sensor, ideal for use in a wide range of light situations. Compared to low cost CdS cells, this sensor is more precise, allowing for exact lux calculations and can be configured for different gain/timing ranges to detect light ranges from 188 uLux up to 88,000 Lux on the fly.The best part of this sensor is that it contains both infrared and full spectrum diodes! That means you can separately measure infrared, full-spectrum or human-visible light. Most sensors can only detect one or the other, which does not accurately represent what human eyes see (since we cannot perceive the IR light that is detected by most photo diodes) This sensor is much like the TSL2561 but with a wider range (and the interface code is different). This sensor has a massive 600,000,000:1 dynamic range! Unlike the TSL2561 you cannot change the I²C address, so keep that in mind. This board/chip uses I²C 7-bit address 0x29.

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the light sensor.
* **address**: I²C address of the sensor.


Sample configurations
--------------------------------------------------------------

tsl2591_sensor_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/tsl2591_sensor/source/tsl2591_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/tsl2591_sensor/render/tsl2591_sensor_basic_esp8266.yaml
   :language: yaml
   :linenos:

VL53L0X Time Of Flight Distance Sensor
==============================================================

.. image:: /static/img/vl53l0x.jpg
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/vl53l0x.html <https://esphome.io/components/sensor/vl53l0x.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the distance sensor.
* **address**: I²C address of the sensor. Defaults to `0x29`.


Xiaomi Mi Flora Sensor
==============================================================

.. image:: /static/img/mi_flora.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/xiaomi_hhccjcy01.html <https://esphome.io/components/sensor/xiaomi_hhccjcy01.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the device.
* **mac_address**: (required) The MAC address of the Xiaomi HHCCJCY01 device.

