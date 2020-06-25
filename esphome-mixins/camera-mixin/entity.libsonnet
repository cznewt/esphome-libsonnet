{
  ai_thinker_camera(config):: {
    esp32_camera: {
      external_clock: {
        pin: 'GPIO0',
        frequency: '20MHz',
      },
      i2c_pins: {
        sda: 'GPIO26',
        scl: 'GPIO27',
      },
      data_pins: [
        'GPIO5',
        'GPIO18',
        'GPIO19',
        'GPIO21',
        'GPIO36',
        'GPIO39',
        'GPIO34',
        'GPIO35',
      ],
      vsync_pin: 'GPIO25',
      href_pin: 'GPIO23',
      pixel_clock_pin: 'GPIO22',
      power_down_pin: 'GPIO32',
      name: config.name,
    },
  },
  ttgo_t_journal_camera(config):: {
    esp32_camera: {
      external_clock: {
        pin: 'GPIO27',
        frequency: '20MHz',
      },
      i2c_pins: {
        sda: 'GPIO25',
        scl: 'GPIO23',
      },
      data_pins: [
        'GPIO17',
        'GPIO35',
        'GPIO34',
        'GPIO5',
        'GPIO39',
        'GPIO18',
        'GPIO36',
        'GPIO19',
      ],
      vsync_pin: 'GPIO22',
      href_pin: 'GPIO26',
      pixel_clock_pin: 'GPIO21',
    },
  },
  ttgo_t_camera_v17_camera(config):: {
    esp32_camera: {
      external_clock: {
        pin: 'GPIO32',
        frequency: '20MHz',
      },
      i2c_pins: {
        sda: 'GPIO13',
        scl: 'GPIO12',
      },
      data_pins: [
        'GPIO5',
        'GPIO14',
        'GPIO4',
        'GPIO15',
        'GPIO18',
        'GPIO23',
        'GPIO36',
        'GPIO39',
      ],
      vsync_pin: 'GPIO27',
      href_pin: 'GPIO25',
      pixel_clock_pin: 'GPIO19',
      vertical_flip: true,
      horizontal_mirror: true,
    },
  },
}
