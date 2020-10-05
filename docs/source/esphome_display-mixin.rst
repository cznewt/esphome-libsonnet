==============================================================
display-mixin
==============================================================

MAX7219 Digit Display
==============================================================

.. image:: /static/img/max7219.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://next.esphome.io/components/display/max7219digit.html <https://next.esphome.io/components/display/max7219digit.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the display.
* **lambda**: (required) The lambda to use for rendering the content on the display.
* **num_chips**: The number of chips you wish to use for daisy chaining. Defaults to `4`.
* **intensity**: The intensity with which the MAX7219 should drive the outputs. Range is from `0`, least intense to `15` the brightest. Defaults to `15`.


Character-Based LCD Display (PCF8574)
==============================================================

.. image:: /static/img/hd44780.jpg
   :width: 45%

This integration is only for LCD displays that display individual characters on a screen (usually 16-20 columns and 2-4 rows), and not for LCD displays that can control each pixel individually.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/display/lcd_display.html <https://esphome.io/components/display/lcd_display.html>`_
* **guide**: `https://circuits4you.com/2019/03/17/esp8266-esp32-i2c-lcd-display-interface/ <https://circuits4you.com/2019/03/17/esp8266-esp32-i2c-lcd-display-interface/>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the display.
* **display_size**: (required, string) The dimensions of the display with COLUMNSxROWS. If you’re not sure, power the display up and just count them.
* **address**: (required) The I²C address of the PCF8574 chip, defaults to `0x3F`.
* **lambda**: (required) The lambda to use for rendering the content on the display.
* **pages**: (required) Show pages instead of a single lambda.


Sample configurations
--------------------------------------------------------------

pcf8574_display_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/pcf8574_display/source/pcf8574_display_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/pcf8574_display/render/pcf8574_display_basic_esp32.yaml
   :language: yaml
   :linenos:

SSD1306 OLED Display (I²C)
==============================================================

.. image:: /static/img/ssd1306.jpg
   :width: 45%

These displays are small, only about 1” diagonal, but very readable due to the high contrast of an OLED display. This display is made of 128x32 individual white OLED pixels, each one is turned on or off by the controller chip. Because the display makes its own light, no backlight is required. This reduces the power required to run the OLED and is why the display has such high contrast. The driver chip SSD1306, communicates via I²C only.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/display/ssd1306.html <https://esphome.io/components/display/ssd1306.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the display.
* **model**: (required) The model of the display. Either `SSD1306` or `SH1106`.
* **display_size**: (required, string) The dimensions of the display in COLUMNSxROWS. Options `128x32`, `128x64`, `96x16` and `64x48`.
* **address**: (required) The I²C address of the display. Defaults to `0x3C`.
* **lambda**: (required) The lambda to use for rendering the content on the display.
* **pages**: (required) Show pages instead of a single lambda.


Sample configurations
--------------------------------------------------------------

ssd1306_i2c_display_128x64_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ssd1306_i2c_display/source/ssd1306_i2c_display_128x64_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ssd1306_i2c_display/render/ssd1306_i2c_display_128x64_esp32.yaml
   :language: yaml
   :linenos:

ssd1306_i2c_display_128x32_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ssd1306_i2c_display/source/ssd1306_i2c_display_128x32_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ssd1306_i2c_display/render/ssd1306_i2c_display_128x32_esp32.yaml
   :language: yaml
   :linenos:

SSD1325 OLED Display
==============================================================

.. image:: /static/img/ssd1325.jpg
   :width: 45%

These displays are small, only about 1” diagonal, but very readable due to the high contrast of an OLED display. This display is made of 128x32 individual white OLED pixels, each one is turned on or off by the controller chip. Because the display makes its own light, no backlight is required. This reduces the power required to run the OLED and is why the display has such high contrast. The driver chip SSD1306, communicates via I²C only.

More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/display/ssd1325.html <https://esphome.io/components/display/ssd1325.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the display.
* **display_size**: (required, string) The dimensions of the display in COLUMNSxROWS. Options `128x32`, `128x64`, `96x16` and `64x48`.
* **lambda**: (required) The lambda to use for rendering the content on the display.
* **pages**: (required) Show pages instead of a single lambda.


Waveshare E-Paper Display
==============================================================

.. image:: /static/img/epaper.jpg
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/display/waveshare_epaper.html <https://esphome.io/components/display/waveshare_epaper.html>`_
* **guide**: `https://www.instructables.com/id/ESP32-E-Paper-Thermometer/ <https://www.instructables.com/id/ESP32-E-Paper-Thermometer/>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the display.
* **model**: (required, string) The model of the E-Paper display. Options are: `1.54in`, `2.13in`, `2.70in`, `2.90in`, `4.20in`, `7.50in`.
* **full_update_every**: (required, string) E-Paper displays have two modes of switching to the next image: A partial update that only changes the pixels that have changed and a full update mode that first clears the entire display and then re-draws the image. The former is much quicker and nicer, but every so often a full update needs to happen because artifacts accumulate. On the 1.54in, 2.13in and 2.90in models you have the option to switch only do a full-redraw every x-th time using this option. Defaults to 30 on the described models and a full update for all other models.
* **lambda**: (required) The lambda to use for rendering the content on the display.
* **pages**: (required) Show pages instead of a single lambda.


Sample configurations
--------------------------------------------------------------

waveshare_epaper_display_pages
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/waveshare_epaper_display/source/waveshare_epaper_display_pages.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/waveshare_epaper_display/render/waveshare_epaper_display_pages.yaml
   :language: yaml
   :linenos:

waveshare_epaper_display_basic
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/waveshare_epaper_display/source/waveshare_epaper_display_basic.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/waveshare_epaper_display/render/waveshare_epaper_display_basic.yaml
   :language: yaml
   :linenos:
