{
  ssd1306_display_entities(config):: {
    display: [
      {
        platform: 'ssd1306_i2c',
        name: config.name,
        model: 'SSD1306 %(display_size)s' % config,
        address: if std.objectHas(config, 'address') then config.address else '0x3C',
        [if std.objectHas(config, 'reset_pin') then 'reset_pin']: config.reset_pin,
        [if std.objectHas(config, 'lambda') then 'lambda']: config.lambda,
      },
    ],
  },
}
