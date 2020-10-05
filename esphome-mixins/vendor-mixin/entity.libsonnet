{
  /**
   * Generic RGBW light.
   *
   * @param config.name Name of the light component.
   */
  generic_rgbw_light(config)::
    {
      output+: [
        {
          platform: 'esp8266_pwm',
          id: 'output_cold_white',
          pin: 'GPIO4',
        },
        {
          platform: 'esp8266_pwm',
          id: 'output_red',
          pin: 'GPIO12',
        },
        {
          platform: 'esp8266_pwm',
          id: 'output_blue',
          pin: 'GPIO14',
        },
        {
          platform: 'esp8266_pwm',
          id: 'output_green',
          pin: 'GPIO13',
        },
        {
          platform: 'esp8266_pwm',
          id: 'output_warm_white',
          pin: 'GPIO5',
        },
      ],
      light+: [
        {
          platform: 'rgbw',
          name: '%(name)s_light' % config,
          red: 'output_red',
          green: 'output_green',
          blue: 'output_blue',
          white: 'output_cold_white',
        },
      ],
    },
}
