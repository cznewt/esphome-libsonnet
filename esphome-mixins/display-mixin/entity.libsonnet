{
  ttf_font(config):: {
    font: [
      {
        id: config.name,
        file: config.file,
        size: if std.objectHas(config, 'size') then config.size else 20,
      },
    ],
  },
  nextion_display(config):: {
    display: [
      {
        platform: 'nextion',
        [if std.objectHas(config, 'lambda') then 'lambda']: config.lambda,
      },
    ],
  },
  pcf8574_display(config):: {
    display: [
      {
        platform: 'lcd_pcf8574',
        dimensions: config.display_size,
        address: if std.objectHas(config, 'address') then config.address else '0x3F',
        [if std.objectHas(config, 'lambda') then 'lambda']: config.lambda,
        [if std.objectHas(config, 'pages') then 'pages']: config.pages,
      },
    ],
  },
  ssd1306_display(config):: {
    display: [
      {
        platform: 'ssd1306_i2c',
        model: 'SSD1306 %(display_size)s' % config,
        address: if std.objectHas(config, 'address') then config.address else '0x3C',
        [if std.objectHas(config, 'reset_pin') then 'reset_pin']: config.reset_pin,
        [if std.objectHas(config, 'lambda') then 'lambda']: config.lambda,
        [if std.objectHas(config, 'pages') then 'pages']: config.pages,
      },
    ],
  },
  waveshare_epaper_display(config):: {
    display: [
      {
        platform: 'waveshare_epaper',
        model: config.model,
        full_update_every: 30,
        cs_pin: config.cs_pin,
        dc_pin: config.dc_pin,
        busy_pin: config.busy_pin,
        [if std.objectHas(config, 'reset_pin') then 'reset_pin']: config.reset_pin,
        [if std.objectHas(config, 'lambda') then 'lambda']: config.lambda,
        [if std.objectHas(config, 'pages') then 'pages']: config.pages,
      },
    ],
  },
}
