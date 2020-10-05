==============================================================
auto-mixin
==============================================================

Timer Switch Service
==============================================================

Service that allows turn switch for only specified time.

Configuration parameters
--------------------------------------------------------------

* **name**: (required) The name of the service.
* **switch**: (required) ID of the switch component.


Sample configurations
--------------------------------------------------------------

timer_switch_service_basic
******************************************************************

Source  configuration:

.. literalinclude:: /static/config/timer_switch_service/source/timer_switch_service_basic.yaml
   :language: yaml
   :linenos:

The rendered configuration:

.. literalinclude:: /static/config/timer_switch_service/render/timer_switch_service_basic.yaml
   :language: yaml
   :linenos:
