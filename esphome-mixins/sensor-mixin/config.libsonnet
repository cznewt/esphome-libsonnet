local entity = (import 'entity.libsonnet');

{
  _config+:: {
    driver+: {
      'ezo_ec.h': (importstr 'source/ezo_ec.h'),
      'ezo_ph.h': (importstr 'source/ezo_ph.h'),
      'tsl2591.h': (importstr 'source/tsl2591.h'),
    },
    entity+: {
      gpio_binary_sensor: entity.gpio_binary_sensor,
      bmp280_sensor: entity.bmp280_sensor,
      bh1750_sensor: entity.bh1750_sensor,
      dallas_ds18_sensor: entity.dallas_ds18_sensor,
      dht_sensor: entity.dht_sensor,
      ezo_ec_sensor: entity.ezo_ec_sensor,
      ezo_orp_sensor: entity.ezo_orp_sensor,
      ezo_ph_sensor: entity.ezo_ph_sensor,
      ezo_temp_comp_ph_sensor: entity.ezo_temp_comp_ph_sensor,
      homeassistant_text_sensor: entity.homeassistant_text_sensor,
      htu21d_sensor: entity.htu21d_sensor,
      max6675_sensor: entity.max6675_sensor,
      pulse_counter_sensor: entity.pulse_counter_sensor,
      rotary_encoder_sensor: entity.rotary_encoder_sensor,
      sgp30_sensor: entity.sgp30_sensor,
      sht3x_sensor: entity.sht3x_sensor,
      tsl2561_sensor: entity.tsl2561_sensor,
      tsl2591_sensor: entity.tsl2591_sensor,
      ultrasonic_sensor: entity.ultrasonic_sensor,
      uptime_sensor: entity.uptime_sensor,
      version_sensor: entity.version_sensor,
      vl53l0x_sensor: entity.vl53l0x_sensor,
      wifi_info_sensor: entity.wifi_info_sensor,
      wifi_signal_sensor: entity.wifi_signal_sensor,
      xiaomi_miflora_sensor: entity.xiaomi_miflora_sensor,
      xiaomi_mijia_sensor: entity.xiaomi_mijia_sensor,
    },
  },
}
