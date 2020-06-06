local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      gpio_relay_switch: entity.gpio_relay_switch_entities,
      gpio_servo: entity.gpio_servo_entities,
      gpio_pwm_fan: entity.gpio_pwm_fan_entities,
      pca9685_servo: entity.pca9685_servo_entities,
      a4988_stepper: entity.a4988_stepper_entities,
      uln2003_stepper: entity.uln2003_stepper_entities,
      allbot_robot: entity.allbot_robot_entities,
    },
  },
}
