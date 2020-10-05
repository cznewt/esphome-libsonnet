==============================================================
camera-mixin
==============================================================

Ai-Thinker Camera
==============================================================

.. image:: /static/img/esp32cam.jpg
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/esp32_camera.html#configuration-for-ai-thinker-camera <https://esphome.io/components/esp32_camera.html#configuration-for-ai-thinker-camera>`_
* **guide**: `https://randomnerdtutorials.com/esp32-cam-troubleshooting-guide/ <https://randomnerdtutorials.com/esp32-cam-troubleshooting-guide/>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the camera.


Sample configurations
--------------------------------------------------------------

ai_thinker_camera_vendor
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ai_thinker_camera/source/ai_thinker_camera_vendor.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ai_thinker_camera/render/ai_thinker_camera_vendor.yaml
   :language: yaml
   :linenos:

AMG8833 IR Thermal Camera
==============================================================

.. image:: /static/img/amg88xx.png
   :width: 45%

AMG88 measures temperatures ranging from 0°C to 80°C (32°F to 176°F) with an accuracy of +- 2.5°C (4.5°F). It can detect a human from a distance of up to 7 meters (23) feet. With a maximum frame rate of 10Hz, It's perfect for creating your own human detector or mini thermal camera.

More information
--------------------------------------------------------------

* **code**: `https://github.com/sparkfun/SparkFun_GridEYE_Arduino_Library <https://github.com/sparkfun/SparkFun_GridEYE_Arduino_Library>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the camera.
* **address**: I²C address of the camera.


Sample configurations
--------------------------------------------------------------

amg88xx_camera_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/amg88xx_camera/source/amg88xx_camera_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/amg88xx_camera/render/amg88xx_camera_basic_esp8266.yaml
   :language: yaml
   :linenos:

amg88xx_camera_basic_esp32
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/amg88xx_camera/source/amg88xx_camera_basic_esp32.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/amg88xx_camera/render/amg88xx_camera_basic_esp32.yaml
   :language: yaml
   :linenos:

M5Stack Camera
==============================================================

.. image:: /static/img/m5stack-camera.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/esp32_camera.html <https://esphome.io/components/esp32_camera.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the camera.


Sample configurations
--------------------------------------------------------------

m5stack_camera_vendor
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/m5stack_camera/source/m5stack_camera_vendor.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/m5stack_camera/render/m5stack_camera_vendor.yaml
   :language: yaml
   :linenos:

TTGO T-Journal Camera
==============================================================

.. image:: /static/img/ttgo-tjournal.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/esp32_camera.html#configuration-for-ttgo-t-journal <https://esphome.io/components/esp32_camera.html#configuration-for-ttgo-t-journal>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the camera.


Sample configurations
--------------------------------------------------------------

ttgo_t_journal_camera_vendor
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/ttgo_t_journal_camera/source/ttgo_t_journal_camera_vendor.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/ttgo_t_journal_camera/render/ttgo_t_journal_camera_vendor.yaml
   :language: yaml
   :linenos:

TTGO T-Camera V05 Camera
==============================================================

.. image:: /static/img/ttgo-tcamera.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/esp32_camera.html#configuration-for-ttgo-t-camera-v05 <https://esphome.io/components/esp32_camera.html#configuration-for-ttgo-t-camera-v05>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the camera.


TTGO T-Camera V17 Camera
==============================================================

.. image:: /static/img/ttgo-tcamera.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/esp32_camera.html#configuration-for-ttgo-t-camera-v17 <https://esphome.io/components/esp32_camera.html#configuration-for-ttgo-t-camera-v17>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the camera.


Wrover Kit Camera
==============================================================

.. image:: /static/img/wrover-kit.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/esp32_camera.html <https://esphome.io/components/esp32_camera.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the camera.

