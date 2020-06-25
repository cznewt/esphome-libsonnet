{
  sonoff_s20_switch(config):: {
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
        ],
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
        ],
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
