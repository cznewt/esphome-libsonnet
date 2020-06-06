local entity = (import 'entity.libsonnet');

{
  _config+:: {
    driver+: {
      'ezo_ec.h': (importstr 'source/ezo_ec.h'),
      'ezo_ph.h': (importstr 'source/ezo_ph.h'),
      'tsl2591.h': (importstr 'source/tsl2591.h'),
    },
    entity+: {
      gpio_binary_sensor: entity.gpio_binary_sensor_entities,
      bmp280_sensor: entity.bmp280_sensor_entities,
      bh1750_sensor: entity.bh1750_sensor_entities,
      dallas_ds18_sensor: entity.dallas_ds18_sensor_entities,
      dht_sensor: entity.dht_sensor_entities,
      ezo_ec_sensor: entity.ezo_ec_sensor_entities,
      ezo_ph_sensor: entity.ezo_ph_sensor_entities,
      homeassistant_text_sensor: entity.homeassistant_text_sensor_entities,
      htu21d_sensor: entity.htu21d_sensor_entities,
      max6675_sensor: entity.max6675_sensor_entities,
      pulse_counter_sensor: entity.pulse_counter_sensor_entities,
      rotary_encoder_sensor: entity.rotary_encoder_sensor_entities,
      sgp30_sensor: entity.sgp30_sensor_entities,
      sht3x_sensor: entity.sht3x_sensor_entities,
      tsl2561_sensor: entity.tsl2561_sensor_entities,
      tsl2591_sensor: entity.tsl2591_sensor_entities,
      ultrasonic_sensor: entity.ultrasonic_sensor_entities,
      uptime_sensor: entity.uptime_sensor_entities,
      version_sensor: entity.version_sensor_entities,
      vl53l0x_sensor: entity.vl53l0x_sensor_entities,
      wifi_info_sensor: entity.wifi_info_sensor_entities,
      wifi_signal_sensor: entity.wifi_signal_sensor_entities,
      xiaomi_miflora_sensor: entity.xiaomi_miflora_sensor_entities,
      xiaomi_mijia_sensor: entity.xiaomi_mijia_sensor_entities,
    },
  },
}
