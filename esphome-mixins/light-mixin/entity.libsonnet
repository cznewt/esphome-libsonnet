{
  neopixel_light_entities(config):: {
    light+: [
      {
        platform: 'neopixelbus',
        type: 'GRB',
        pin: config.pin,
        num_leds: config.num_leds,
        name: config.name,
      },
    ],
  },
  fastled_light_entities(config):: {
    light+: [
      {
        platform: 'fastled_clockless',
        chipset: 'WS2811',
        pin: config.pin,
        rgb_order: 'BRG',
        num_leds: config.num_leds,
        name: config.name,
      },
    ],
  },
}
