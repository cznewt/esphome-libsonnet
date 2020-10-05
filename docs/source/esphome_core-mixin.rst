==============================================================
core-mixin
==============================================================

Dallas Hub
==============================================================

Dallas hub allows you to use your DS18b20 and similar 1-Wire temperature sensors. The 1-Wire bus the sensors are connected to should have an external pullup resistor of about 4.7KΩ. For this, connect a resistor of about 4.7KΩ (values around that like 1Ω will, if you don’t have massively long wires, work fine in most cases) between 3.3V and the data pin.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/dallas.html <https://esphome.io/components/sensor/dallas.html>`_

Configuration parameters
--------------------------------------------------------------

* **pin**: (required) The pin the sensor bus is connected to.
* **id**: ID used for code generation.


Sample configurations
--------------------------------------------------------------

dallas_bus_multiple
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/dallas_bus/source/dallas_bus_multiple.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/dallas_bus/render/dallas_bus_multiple.yaml
   :language: yaml
   :linenos:

dallas_bus_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/dallas_bus/source/dallas_bus_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/dallas_bus/render/dallas_bus_basic_esp8266.yaml
   :language: yaml
   :linenos:

I²C Bus
==============================================================

I²C bus to communicate with devices. ESP will enable its internal 10kΩ pullup resistors for these pins, so you usually don’t need to put on external ones.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/sensor/dallas.html <https://esphome.io/components/sensor/dallas.html>`_
* **guide**: `https://randomnerdtutorials.com/esp32-i2c-communication-arduino-ide/ <https://randomnerdtutorials.com/esp32-i2c-communication-arduino-ide/>`_

Configuration parameters
--------------------------------------------------------------

* **data_pin**: (required) The pin for the data line of the I²C bus. Defaults to the default of your board (usually GPIO21 for ESP32 and GPIO4 for ESP8266).
* **clock_pin**: (required) The pin for the clock line of the I²C bus. Defaults to the default of your board (usually GPIO22 for ESP32 and GPIO5 for ESP8266).
* **id**: Manually specify the ID for this SPI hub if you need multiple I²C buses.


Sample configurations
--------------------------------------------------------------

i2c_bus_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/i2c_bus/source/i2c_bus_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/i2c_bus/render/i2c_bus_basic_esp8266.yaml
   :language: yaml
   :linenos:

i2c_bus_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/i2c_bus/source/i2c_bus_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/i2c_bus/render/i2c_bus_basic_esp32.yaml
   :language: yaml
   :linenos:

i2c_bus_multiple_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/i2c_bus/source/i2c_bus_multiple_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/i2c_bus/render/i2c_bus_multiple_esp32.yaml
   :language: yaml
   :linenos:

SPI Bus
==============================================================

SPI is a very common high-speed protocol for a lot of devices. The SPI bus usually consists of 4 wires: CLK: Is used to tell the receiving device when to read data. All devices on the bus can share this line. Sometimes also called SCK. CS (chip select): Is used to tell the receiving device when it should listen for data. Each device has an individual CS line. Sometimes also called SS. MOSI (also DIN): Is used to send data from the master (the ESP) to the receiving device. All devices on the bus can share this line. MISO (also DOUT): Is used to receive data. All devices on the bus can share this line. In some cases one of MOSI or MISO do not exist as the receiving device only accepts data or sends data. 

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/spi.html <https://esphome.io/components/spi.html>`_

Configuration parameters
--------------------------------------------------------------

* **clk_pin**: (required) The pin used for the clock line of the SPI bus.
* **mosi_pin**: The pin used for the MOSI line of the SPI bus.
* **miso_pin**: The pin used for the MISO line of the SPI bus.
* **id**: Manually specify the ID for this SPI hub if you need multiple SPI hubs.


Sample configurations
--------------------------------------------------------------

spi_bus_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/spi_bus/source/spi_bus_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/spi_bus/render/spi_bus_basic_esp32.yaml
   :language: yaml
   :linenos:

UART Bus
==============================================================

UART is a common serial protocol for a lot of devices. For example, when uploading a binary to your ESP you have probably used UART to access the chip. UART (or for Arduino often also called Serial) usually consists of 2 pins: TX: This line is used to send data to the device at the other end. RX: This line is used to receive data from the device at the other end.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/uart.html <https://esphome.io/components/uart.html>`_

Configuration parameters
--------------------------------------------------------------

* **tx_pin**: (required)  The pin to send data to from the ESP’s perspective.
* **rx_pin**: The pin to receive data on from the ESP’s perspective.
* **baud_rate**: The baud rate of the UART bus.
* **stop_bits**: The number of stop bits to send. Options: 1, 2. Defaults to 1.
* **id**: Manually specify the ID for this UART hub if you need multiple UART hubs.


Sample configurations
--------------------------------------------------------------

uart_bus_hw_02_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/uart_bus/source/uart_bus_hw_02_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/uart_bus/render/uart_bus_hw_02_esp8266.yaml
   :language: yaml
   :linenos:

uart_bus_hw_01_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/uart_bus/source/uart_bus_hw_01_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/uart_bus/render/uart_bus_hw_01_esp8266.yaml
   :language: yaml
   :linenos:

uart_bus_hw_01_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/uart_bus/source/uart_bus_hw_01_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/uart_bus/render/uart_bus_hw_01_esp32.yaml
   :language: yaml
   :linenos:

PCA9685 12-bit PWM Driver
==============================================================

.. image:: /static/img/pca9685.jpg
   :width: 45%

PCA9685 12-bit PWM driver uses I²C Bus for communication.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/output/pca9685.html <https://esphome.io/components/output/pca9685.html>`_

Configuration parameters
--------------------------------------------------------------

* **frequency**: (required) The frequency to let the component drive all PWM outputs at. Must be in range from 24Hz to 1526Hz.
* **address**: The I²C address of the driver. This board uses I2C 7-bit address between 0x40-0x7F, selectable with jumpers.
* **id**: Use this if you have multiple PCA9685s connected at the same time.


Sample configurations
--------------------------------------------------------------

pca9685_board_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/pca9685_board/source/pca9685_board_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/pca9685_board/render/pca9685_board_basic_esp8266.yaml
   :language: yaml
   :linenos:

PCF8574 I/O Expander
==============================================================

.. image:: /static/img/pcf8574.jpg
   :width: 45%

PCF8574 I/O expander use I²C bus for communication.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/pcf8574.html <https://esphome.io/components/pcf8574.html>`_

Configuration parameters
--------------------------------------------------------------

* **address**: The I²C address of the driver. Defaults to `0x21`.
* **id**: The ID to use for this PCF8574 component.


Sample configurations
--------------------------------------------------------------

pcf8574_board_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/pcf8574_board/source/pcf8574_board_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/pcf8574_board/render/pcf8574_board_basic_esp8266.yaml
   :language: yaml
   :linenos:

PCF8575 I/O Expander
==============================================================

.. image:: /static/img/pcf8575.png
   :width: 45%

PCF8575 I/O expander use I²C bus for communication.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/pcf8574.html <https://esphome.io/components/pcf8574.html>`_

Configuration parameters
--------------------------------------------------------------

* **address**: The I²C address of the driver. Defaults to `0x21`.
* **id**: The ID to use for this PCF8575 component.


Sample configurations
--------------------------------------------------------------

pcf8575_board_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/pcf8575_board/source/pcf8575_board_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/pcf8575_board/render/pcf8575_board_basic_esp8266.yaml
   :language: yaml
   :linenos:

TLC59208F 8-bit PWM Driver
==============================================================



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/output/tlc59208f.html <https://esphome.io/components/output/tlc59208f.html>`_

Configuration parameters
--------------------------------------------------------------

* **address**: The I²C address of the driver. Defaults to `0x20`.
* **id**: The ID to use for this TLC59208F component. Use this if you have multiple TLC59208Fs connected at the same time.


Sample configurations
--------------------------------------------------------------

tlc59208f_board_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/tlc59208f_board/source/tlc59208f_board_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/tlc59208f_board/render/tlc59208f_board_basic_esp8266.yaml
   :language: yaml
   :linenos:

Home Assistant Time Source
==============================================================



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/time.html#home-assistant-time-source <https://esphome.io/components/time.html#home-assistant-time-source>`_

Configuration parameters
--------------------------------------------------------------

* **timezone**: Manually tell ESPHome what time zone to use with TZ database name in the form <Region>/<City>.
* **on_time**: Automation to run at specific intervals using a cron-like syntax.

