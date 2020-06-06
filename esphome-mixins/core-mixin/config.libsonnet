local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      ble_bus: entity.ble_bus_entities,
      dallas_bus: entity.dallas_bus_entities,
      i2c_bus: entity.i2c_bus_entities,
      spi_bus: entity.spi_bus_entities,
      uart_bus: entity.uart_bus_entities,
      status_led: entity.status_led_entities,
      pca9685_board: entity.pca9685_board_entities,
      tlc59208f_board: entity.tlc59208f_board_entities,
    },
  },
}
