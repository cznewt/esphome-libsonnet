local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      ble_bus: entity.ble_bus,
      dallas_bus: entity.dallas_bus,
      i2c_bus: entity.i2c_bus,
      spi_bus: entity.spi_bus,
      uart_bus: entity.uart_bus,
      status_led: entity.status_led,
      pca9685_board: entity.pca9685_board,
      tlc59208f_board: entity.tlc59208f_board,
    },
  },
}
