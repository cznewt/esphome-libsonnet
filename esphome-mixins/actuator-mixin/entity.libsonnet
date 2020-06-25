local allbot_src = {
  _fun: (importstr 'source/_allbot_fun.h'),
  _vr408: (importstr 'source/_allbot_vr408.h'),
  _cmd: (importstr 'source/_allbot_cmd.h'),
};

{
  gpio_relay_switch(config):: {
    local inverted = if std.objectHas(config, 'inverted') then config.inverted else false,
    switch+: [
      {
        platform: 'gpio',
        name: config.name,
        pin: if inverted then {
          number: config.pin,
          inverted: 'yes',
        }
        else config.pin,
      },
    ],
  },
  gpio_pwm_fan(config):: {
    fan+: [
      {
        platform: 'speed',
        id: config.name,
        output: config.name + '_output',
      },
    ],

    output+: [
      {
        platform: 'esp8266_pwm',
        id: config.name + '_output',
        pin: config.pin,
        frequency: config.bus,
      },
    ],
  },
  allbot_robot(config):: {
    api_service+: [
      {
        service: 'run_command',
        variables: {
          command: 'string',
          times: 'int',
          speed: 'int',
        },
        'then': [
          {
            lambda:
              allbot_src._fun +
              allbot_src['_' + config.device] +
              allbot_src._cmd +
              //'ESP_LOGD("api_run_command", "Executing command %s", );\n' +
              'ESP_LOGD("api_run_command", "Running %i times", times);' +
              'ESP_LOGD("api_run_command", "Speed %i ms", speed);',
          },
        ],
      },
      {
        service: 'detach_all_servos',
        'then': [
          {
            lambda:
              std.join('\n', [
                'id(%(name)s).detach();' % joint
                for joint in config.joints
              ] + [
                'ESP_LOGD("api_detach_all_servos", "Detached servo %(name)s");' % joint
                for joint in config.joints
              ]),
          },
        ],
      },
    ],
  },
  _servo(config):: {
    api_service+: [
      {
        service: 'set_angle_' + config.name,
        variables: {
          angle: 'float',
        },
        'then': [
          {
            lambda: |||
              id(%(name)s).write(angle / 90.0);
              ESP_LOGD("api_set_angle_%(name)s", "Set angle of servo %(name)s");
            ||| % config,
          },
        ],
      },
      {
        service: 'detach_servo_' + config.name,
        'then': [
          {
            lambda: |||
              id(%(name)s).detach();
              ESP_LOGD("api_detach_servo_%(name)s", "Detached servo %(name)s");
            ||| % config,
          },
        ],
      },
    ],
    servo+: [
      {
        id: config.name,
        output: config.name + '_output',
      },
    ],
  },
  gpio_servo(config):: $._servo(config) + {
    output+: [
      {
        platform: 'esp8266_pwm',
        id: config.name + '_output',
        pin: config.pin,
        frequency: config.bus,
      },
    ],
  },
  pca9685_servo(config):: $._servo(config) + {
    output+: [
      {
        platform: 'pca9685',
        id: config.name + '_output',
        channel: config.channel,
        pca9685_id: config.bus,
      },
    ],
  },
  a4988_stepper(config):: {
    stepper+: [
      {
        platform: 'a4988',
        id: config.name,
        step_pin: config.step_pin,
        dir_pin: config.dir_pin,
        max_speed: '250 steps/s',
        [if std.objectHas(config, 'sleep_pin') then 'sleep_pin']: config.sleep_pin,
        [if std.objectHas(config, 'acceleration') then 'acceleration']: config.acceleration,
        [if std.objectHas(config, 'deceleration') then 'deceleration']: config.deceleration,
      },
    ],
  },
  uln2003_stepper(config):: {
    stepper+: [
      {
        platform: 'uln2003',
        id: config.name,
        pin_a: config.pin_a,
        pin_b: config.pin_b,
        pin_c: config.pin_c,
        pin_d: config.pin_d,
        max_speed: '250 steps/s',
        [if std.objectHas(config, 'acceleration') then 'acceleration']: config.acceleration,
        [if std.objectHas(config, 'deceleration') then 'deceleration']: config.deceleration,
      },
    ],
  },
}
