{
  ble_bus(config):: {
    esp32_ble_tracker: {
      id: if std.objectHas(config, 'id') then config.id else 'ble_1',
      scan_parameters: {
        active: if std.objectHas(config, 'active_scan') then config.active_scan else false,
      },
    },
  },
  dallas_bus(config):: {
    dallas+: [
      {
        id: if std.objectHas(config, 'id') then config.id else 'dallas_1',
        pin: config.pin,
      },
    ],
  },
  i2c_bus(config):: {
    i2c+: [
      {
        id: if std.objectHas(config, 'id') then config.id else 'i2c_1',
        sda: config.data_pin,
        scl: config.clock_pin,
        scan: true,
        [if std.objectHas(config, 'frequency') then 'frequency']: config.frequency,
      },
    ],
  },
  spi_bus(config):: {
    spi: {
      clk_pin: config.clk_pin,
      mosi_pin: config.mosi_pin,
      [if std.objectHas(config, 'miso_pin') then 'miso_pin']: config.miso_pin,
    },
  },
  uart_bus(config):: {
    uart: {
      tx_pin: config.tx_pin,
      rx_pin: config.rx_pin,
      baud_rate: if std.objectHas(config, 'baud_rate') then config.baud_rate else 9600,
    },
  },
  status_led(config):: {
    status_led: {
      pin: {
        number: config.pin,
        [if std.objectHas(config, 'inverted') then 'inverted']: config.inverted,
      },
    },
  },
  pca9685_board(config):: {
    pca9685+: [{
      frequency: 500,
      id: if std.objectHas(config, 'id') then config.id else 'pca_1',
      address: std.format('0x%x', config.address),
    }],
  },
  tlc59208f_board(config):: {
    tlc59208f+: [{
      id: if std.objectHas(config, 'id') then config.id else 'tlc_1',
      address: std.format('0x%x', config.address),
    }],
  },
}
