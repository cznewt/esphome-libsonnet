local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      gpio_relay_switch: entity.gpio_relay_switch,
      gpio_servo: entity.gpio_servo,
      gpio_pwm_fan: entity.gpio_pwm_fan,
      pca9685_servo: entity.pca9685_servo,
      a4988_stepper: entity.a4988_stepper,
      uln2003_stepper: entity.uln2003_stepper,
      allbot_robot: entity.allbot_robot,
    },
  },
}
