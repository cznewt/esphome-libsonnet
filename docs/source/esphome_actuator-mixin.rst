==============================================================
actuator-mixin
==============================================================

Generic Servo Motor (Partial)
==============================================================



Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the servo.
* **min_level**: The PWM duty cycle the minimum value (-100%) will map to. Defaults to `3%`.
* **max_level**: The PWM duty cycle the maximum value (100%) will map to. Defaults to `12.0%`.
* **idle_level**: The PWM duty cycle the idle value (0%) will map to. This is also the state of the servo at startup. Defaults to `7.5%`.
* **restore**: Whether to restore the state of the servo motor at startup. This is useful if you have an absolute servo motor and it goes back to its 0 position at startup. Defaults to `false`.


GPIO Relay Switch
==============================================================

.. image:: /static/img/relay.jpg
   :width: 45%

.. image:: /static/img/relay-solid-state.png
   :width: 45%



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/switch/gpio.html <https://esphome.io/components/switch/gpio.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the switch.
* **pin**: (required) The GPIO pin to use for the switch.


Sample configurations
--------------------------------------------------------------

gpio_relay_switch_basic
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/gpio_relay_switch/source/gpio_relay_switch_basic.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/gpio_relay_switch/render/gpio_relay_switch_basic.yaml
   :language: yaml
   :linenos:

gpio_relay_switch_inverted
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/gpio_relay_switch/source/gpio_relay_switch_inverted.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/gpio_relay_switch/render/gpio_relay_switch_inverted.yaml
   :language: yaml
   :linenos:

GPIO l9110s Motor
==============================================================

.. image:: /static/img/l9110s.png
   :width: 45%



Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the motor.
* **pin_a**: (required)
* **pin_b**: (required)


Sample configurations
--------------------------------------------------------------

gpio_l9110s_motor_basic
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/gpio_l9110s_motor/source/gpio_l9110s_motor_basic.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/gpio_l9110s_motor/render/gpio_l9110s_motor_basic.yaml
   :language: yaml
   :linenos:

GPIO l293d Motor
==============================================================

.. image:: /static/img/l293d.jpg
   :width: 45%

.. image:: /static/img/l293d.png
   :width: 45%



Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the motor.
* **power_pin**: (required) L293D pin 1 or pin 9: On or off.
* **acw_pin**: (required) L293D pin 2 or pin 10: Anticlockwise rotation.
* **cw_pin**: (required) L293D pin 7 or pin 15: Clockwise rotation.


Sample configurations
--------------------------------------------------------------

gpio_l293d_motor_basic
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/gpio_l293d_motor/source/gpio_l293d_motor_basic.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/gpio_l293d_motor/render/gpio_l293d_motor_basic.yaml
   :language: yaml
   :linenos:

GPIO Binary Fan
==============================================================



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/fan/binary.html <https://esphome.io/components/fan/binary.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the fan.


PWM Speed Fan
==============================================================



More information
--------------------------------------------------------------

* **documentation**: `https://esphome.io/components/fan/speed.html <https://esphome.io/components/fan/speed.html>`_

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the fan.


PWM Servo Motor
==============================================================

.. image:: /static/img/sg90.jpg
   :width: 45%

Works with both continuous-rotation and absolute servos and has a similar interface to the Arduino Servo library. Please note the frequency of the output must be around 50Hz, as most servo controllers only operate in this frequency range.

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the servo.
* **pin**: (required) The pin to use PWM servo on.
* **frequency**: (required) The frequency to run the PWM with. Lower frequencies have more visual artifacts, but can represent much more colors. Defaults to `50Hz` for servo.


Sample configurations
--------------------------------------------------------------

gpio_pwm_servo_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/gpio_pwm_servo/source/gpio_pwm_servo_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/gpio_pwm_servo/render/gpio_pwm_servo_basic_esp8266.yaml
   :language: yaml
   :linenos:

PCA9685 Servo Motor
==============================================================

.. image:: /static/img/sg90.jpg
   :width: 45%



Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the servo.
* **channel**: (required) Chose the channel of the PCA9685. Must be in range from `0` to `15`.
* **bus**: ID of the PCA9685 hub. Use this if you have multiple PCA9685s you want to use at the same time.


Sample configurations
--------------------------------------------------------------

pca9685_servo_basic_esp8266
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/pca9685_servo/source/pca9685_servo_basic_esp8266.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/pca9685_servo/render/pca9685_servo_basic_esp8266.yaml
   :language: yaml
   :linenos:

A4988 Stepper Motor
==============================================================

.. image:: /static/img/a4988.jpg
   :width: 45%



Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the stepper motor.
* **step_pin**: (required) The `STEP` pin of the A4988 stepper driver.
* **dir_pin**: (required) The `DIRECTION` pin of the A4988 stepper driver.
* **max_speed**: (required) The maximum speed in `steps/s` (steps per seconds) to drive the stepper at. Note most steppers can’t step properly with speeds higher than 250 steps/s.
* **sleep_pin**: Optionally also use the `SLEEP` pin of the A4988 stepper driver. If specified, the driver will be put into sleep mode as soon as the stepper reaches the target steps.
* **acceleration**: The acceleration in `steps/s^2` (steps per seconds squared) to use when starting to move. The default is `inf` which means infinite acceleration, so the stepper will try to drive with the full speed immediately.
* **deceleration**:  The same as `acceleration`, but for when the motor is decelerating shortly before reaching the set position. Defaults to `inf` (immediate deceleration).


Sample configurations
--------------------------------------------------------------

a4988_stepper_basic
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/a4988_stepper/source/a4988_stepper_basic.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/a4988_stepper/render/a4988_stepper_basic.yaml
   :language: yaml
   :linenos:

uln2003_stepper_advanced
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/a4988_stepper/source/uln2003_stepper_advanced.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/a4988_stepper/render/uln2003_stepper_advanced.yaml
   :language: yaml
   :linenos:

ULN2003 Stepper Motor
==============================================================

.. image:: /static/img/uln2003.jpg
   :width: 45%

ULN2003 driver board 5-wire phase can ordinary uln2003 chip can also be connected as phase 2 can support development boards, straight plug, easy to use stepper motors used in the development board.

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the stepper motor.
* **acceleration**: The acceleration in `steps/s^2` (steps per seconds squared) to use when starting to move. The default is `inf` which means infinite acceleration, so the stepper will try to drive with the full speed immediately.
* **deceleration**:  The same as `acceleration`, but for when the motor is decelerating shortly before reaching the set position. Defaults to `inf` (immediate deceleration).


Sample configurations
--------------------------------------------------------------

uln2003_stepper_advanced
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/uln2003_stepper/source/uln2003_stepper_advanced.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/uln2003_stepper/render/uln2003_stepper_advanced.yaml
   :language: yaml
   :linenos:

uln2003_stepper_basic
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/uln2003_stepper/source/uln2003_stepper_basic.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/uln2003_stepper/render/uln2003_stepper_basic.yaml
   :language: yaml
   :linenos:
