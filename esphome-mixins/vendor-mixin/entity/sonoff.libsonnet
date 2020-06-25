{
  sonoff_4ch_pro_r2_switch(config):: {
    // https://esphome-configs.io/devices/sonoff-4ch-pro-r2/
    binary_sensor: [
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO0',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        on_press: [
          {
            'switch.toggle': 'relay_1',
          },
        ],
      },
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO9',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        on_press: [
          {
            'switch.toggle': 'relay_2',
          },
        ],
      },
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO10',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        on_press: [
          {
            'switch.toggle': 'relay_3',
          },
        ],
      },
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO14',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        on_press: [
          {
            'switch.toggle': 'relay_4',
          },
        ],
      },
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO0',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        name: '%(name)s_button_1' % config,
      },
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO9',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        name: '%(name)s_button_2' % config,
      },
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO10',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        name: '%(name)s_button_3' % config,
      },
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO14',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        name: '%(name)s_button_4' % config,
      },
    ],
    switch: [
      {
        platform: 'gpio',
        name: '%(name)s_relay_1' % config,
        pin: 'GPIO12',
        id: 'relay_1',
      },
      {
        platform: 'gpio',
        name: '%(name)s_relay_2' % config,
        pin: 'GPIO5',
        id: 'relay_2',
      },
      {
        platform: 'gpio',
        name: '%(name)s_relay_3' % config,
        pin: 'GPIO4',
        id: 'relay_3',
      },
      {
        platform: 'gpio',
        name: '%(name)s_relay_4' % config,
        pin: 'GPIO15',
        id: 'relay_4',
      },
    ],
  },
  sonoff_s20_switch(config):: {
    // https://esphome-configs.io/devices/sonoff-s20/
    binary_sensor+: [
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO0',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        name: '%(name)s_button' % config,
        on_press: [
          {
            'switch.toggle': '%(name)s_relay' % config,
          },
        ] + if std.objectHas(config, 'auto_turn_off') then [
          {
            delay: config.auto_turn_off,
          },
          {
            'switch.turn_off': '%(name)s_relay' % config,
          },
        ] else [],
      },
      {
        platform: 'status',
        name: '%(name)s_status' % config,
      },
    ],
    switch+: [
      {
        platform: 'gpio',
        name: '%(name)s_relay' % config,
        pin: 'GPIO12',
        id: '%(name)s_relay' % config,
      },
    ],
    output+: [
      {
        platform: 'esp8266_pwm',
        id: '%(name)s_green_led' % config,
        pin: 'GPIO13',
        inverted: true,
      },
    ],
    light+: [
      {
        platform: 'monochromatic',
        name: '%(name)s_green_led' % config,
        output: '%(name)s_green_led' % config,
      },
    ],
  },
  sonoff_s26_switch(config):: {
    // https://esphome-configs.io/devices/sonoff-s20/
    binary_sensor+: [
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO0',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        name: '%(name)s_button' % config,
        on_press: [
          {
            'switch.toggle': '%(name)s_relay' % config,
          },
        ] + if std.objectHas(config, 'auto_turn_off') then [
          {
            delay: config.auto_turn_off,
          },
          {
            'switch.turn_off': '%(name)s_relay' % config,
          },
        ] else [],
      },
      {
        platform: 'status',
        name: '%(name)s_status' % config,
      },
    ],
    switch+: [
      {
        platform: 'gpio',
        name: '%(name)s_relay' % config,
        pin: 'GPIO12',
        id: '%(name)s_relay' % config,
      },
    ],
    output+: [
      {
        platform: 'esp8266_pwm',
        id: '%(name)s_green_led' % config,
        pin: 'GPIO13',
        inverted: true,
      },
    ],
    light+: [
      {
        platform: 'monochromatic',
        name: '%(name)s_green_led' % config,
        output: '%(name)s_green_led' % config,
      },
    ],
  },
  sonoff_mini_switch(config):: {
    binary_sensor+: [
      {
        platform: 'gpio',
        pin: {
          number: 'GPIO0',
          mode: 'INPUT_PULLUP',
          inverted: true,
        },
        name: '%(name)s_button' % config,
        on_press: [
          {
            'switch.toggle': '%(name)s_relay' % config,
          },
        ] + if std.objectHas(config, 'auto_turn_off') then [
          {
            delay: config.auto_turn_off,
          },
          {
            'switch.turn_off': '%(name)s_relay' % config,
          },
        ] else [],
      },
      {
        platform: 'status',
        name: '%(name)s_status' % config,
      },
    ],
    switch+: [
      {
        platform: 'gpio',
        name: '%(name)s_relay' % config,
        pin: 'GPIO12',
        id: '%(name)s_relay' % config,
      },
    ],
    output+: [
      {
        platform: 'esp8266_pwm',
        id: '%(name)s_green_led' % config,
        pin: 'GPIO13',
        inverted: true,
      },
    ],
    light+: [
      {
        platform: 'monochromatic',
        name: '%(name)s_green_led' % config,
        output: '%(name)s_green_led' % config,
      },
    ],
  },
}
