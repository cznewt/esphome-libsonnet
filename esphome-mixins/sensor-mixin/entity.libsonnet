{
  text_sensor_params(config):: {
    [if std.objectHas(config, 'icon') then 'icon']: config.icon,
    [if std.objectHas(config, 'on_value') then 'on_value']: config.on_value,
  },
  sensor_params(config):: {
    [if std.objectHas(config, 'unit_of_measurement') then 'unit_of_measurement']: config.unit_of_measurement,
    [if std.objectHas(config, 'icon') then 'icon']: config.icon,
    [if std.objectHas(config, 'accuracy_decimals') then 'accuracy_decimals']: config.accuracy_decimals,
    [if std.objectHas(config, 'expire_after') then 'expire_after']: config.expire_after,
    [if std.objectHas(config, 'filters') then 'filters']: config.filters,
  },
  sensor_update_params(config):: {
    update_interval: if std.objectHas(config, 'update_interval') then config.update_interval else '5s',
  } + $.sensor_params(config),
  i2c_params(config, address, address_str=null):: {
    [if std.objectHas(config, 'bus') then 'i2c_id']: config.bus,
    address: std.format(
      '0x%x',
      if std.objectHas(config, 'address') then config.address else address
    ),
  } + $.sensor_update_params(config),
  bh1750_sensor(config):: {
    sensor+: [
      {
        platform: 'bh1750',
        name: '%(name)s_light_intensity' % config,
      } + $.i2c_params(config, 35, '0x23'),
    ],
  },
  bmp280_sensor(config):: {
    sensor+: [
      {
        platform: 'bmp280',
        temperature: {
          name: '%(name)s_temperature' % config,
          oversampling: '16x',
        },
        pressure: {
          name: '%(name)s_pressure' % config,
        },
      } + $.i2c_params(config, 118, '0x76'),
    ],
  },
  dallas_ds18_sensor(config):: {
    sensor+: [
      {
        platform: 'dallas',
        address: config.address,
        name: config.name,
      } + $.sensor_params(config),
    ],
  },
  dht_sensor(config):: {
    sensor+: [
      {
        platform: 'dht',
        model: if std.objectHas(config, 'model') then config.model else 'DHT22',
        temperature: {
          name: '%(name)s_temperature' % config,
        },
        humidity: {
          name: '%(name)s_humidity' % config,
        },
        pin: config.pin,
        update_interval: if std.objectHas(config, 'update_interval') then config.update_interval else '5s',
      } + $.sensor_update_params(config),
    ],
  },
  ezo_ec_sensor(config):: {
    includes: [
      'ezo_ec.h',
    ],
    libraries: [
      'Ezo_I2c_lib',
    ],
    sensor+: [
      {
        platform: 'custom',
        lambda: |||
          auto ezo_ec_sensor = new EzoEcSensor(%(update_interval)s, %(address)x);
          App.register_component(ezo_ec_sensor);
          return {ezo_ec_sensor->ec_sensor, ezo_ec_sensor->tds_sensor, ezo_ec_sensor->s_sensor, ezo_ec_sensor->sg_sensor};
        ||| % config,
        sensors: [
          {
            name: '%(name)s_conductivity' % config,
            unit_of_measurement: 'uS/cm',
            icon: 'mdi:flower',
          },
          {
            name: '%(name)s_total_dissolved_solids' % config,
            unit_of_measurement: 'ppm',
          },
          {
            name: '%(name)s_salinity' % config,
            unit_of_measurement: 'PSU',
          },
          {
            name: '%(name)s_specific_gravity' % config,
            unit_of_measurement: 'g/cm3',
          },
        ],
      } + $.sensor_params(config),
    ],
  },
  ezo_orp_sensor(config):: {
    includes: [
      'ezo_orp.h',
    ],
    libraries: [
      'Ezo_I2c_lib',
    ],
    sensor+: [
      {
        platform: 'custom',
        lambda: |||
          auto ezo_orp_sensor = new EzoOrpSensor(%(update_interval)s, %(address)x);
          App.register_component(ezo_orp_sensor);
          return {ezo_orp_sensor};
        ||| % config,
        sensors: [
          {
            name: '%(name)s_oxidation_reduction_potencial' % config,
            unit_of_measurement: 'ORP',
            accuracy_decimals: 2,
          },
        ],
      } + $.sensor_params(config),
    ],
  },
  ezo_ph_sensor(config):: {
    includes: [
      'ezo_ph.h',
    ],
    libraries: [
      'Ezo_I2c_lib',
    ],
    sensor+: [
      {
        platform: 'custom',
        lambda: |||
          auto ezo_ph_sensor = new EzoPhSensor(%(update_interval)s, %(address)x);
          App.register_component(ezo_ph_sensor);
          return {ezo_ph_sensor};
        ||| % config,
        sensors: [
          {
            name: '%(name)s_ph' % config,
            unit_of_measurement: '',
            accuracy_decimals: 2,
          },
        ],
      } + $.sensor_params(config),
    ],
  },
  ezo_temp_comp_ph_sensor(config):: {
    includes: [
      'ezo_ph_temp.h',
    ],
    libraries: [
      'Ezo_I2c_lib',
    ],
    sensor+: [
      {
        platform: 'custom',
        lambda: |||
          auto ezo_ph_temp_sensor = new EzoTempCompPhSensor(%(update_interval)s, %(address)x, %(sensor_id)x);
          App.register_component(ezo_ph_temp_sensor);
          return {ezo_ph_temp_sensor};
        ||| % config,
        sensors: [
          {
            name: '%(name)s_ph' % config,
            unit_of_measurement: '',
            accuracy_decimals: 2,
          },
        ],
      } + $.sensor_params(config),
    ],
  },
  gpio_binary_sensor(config):: {
    binary_sensor+: [
      {
        platform: 'gpio',
        name: '%(name)s_%(device_class)s' % ({ device_class: 'sensor' } + config),
        pin: config.pin,
        device_class: config.device_class,
      } + $.sensor_params(config),
    ],
  },
  htu21d_sensor(config):: {
    sensor+: [
      {
        platform: 'htu21d',
        temperature: {
          name: '%(name)s_temperature' % config,
        },
        humidity: {
          name: '%(name)s_humidity' % config,
        },
      } + $.i2c_params(config, 64, '0x40'),
    ],
  },
  max6675_sensor(config):: {
    sensor+: [
      {
        platform: 'max6675',
        name: '%(name)s_temperature' % config,
        [if std.objectHas(config, 'bus') then 'spi_id']: config.bus,
        cs_pin: config.cs_pin,
      } + $.sensor_update_params(config),
    ],
  },
  pulse_counter_sensor(config):: {
    sensor+: [
      {
        platform: 'max6675',
        name: '%(name)s' % config,
        pin: config.pin,
      } + $.sensor_update_params(config),
    ],
  },
  rotary_encoder_sensor(config):: {
    sensor+: [
      {
        platform: 'rotary_encoder',
        name: '%(name)s' % config,
        pin_a: config.pin_a,
        pin_b: config.pin_b,
      } + $.sensor_update_params(config),
    ],
  },
  sgp30_sensor(config):: {
    sensor+: [
      {
        platform: 'sgp30',
        eco2: {
          name: '%(name)s_co2' % config,
          accuracy_decimals: 1,
        },
        tvoc: {
          name: '%(name)s_coc' % config,
          accuracy_decimals: 1,
        },
      } + $.i2c_params(config, 88, '0x58'),
    ],
  },
  sht3x_sensor(config):: {
    sensor+: [
      {
        platform: 'sht3xd',
        temperature: {
          name: '%(name)s_temperature' % config,
        },
        humidity: {
          name: '%(name)s_humidity' % config,
        },
      } + $.i2c_params(config, 68, '0x44'),
    ],
  },
  tsl2561_sensor(config):: {
    sensor+: [
      {
        platform: 'tsl2561',
        name: '%(name)s_light_intensity' % config,
      } + $.i2c_params(config, 57, '0x39'),
    ],
  },
  tsl2591_sensor(config):: {
    includes: [
      'tsl2591.h',
    ],
    libraries: [
      'Adafruit TSL2591 Library',
      'Adafruit Unified Sensor',
    ],
    sensor+: [
      {
        platform: 'custom',
        lambda: |||
          auto tsl2591_sensor = new Tsl2591Sensor(%(update_interval)s);
          App.register_component(tsl2591_sensor);
          return {tsl2591_sensor};
        ||| % config,
        sensors: [
          {
            name: '%(name)s_light_intensity' % config,
            unit_of_measurement: 'lx',
            accuracy_decimals: 2,
          },
        ],
      } + $.sensor_params(config),
    ],
  },
  ultrasonic_sensor(config):: {
    sensor+: [
      {
        platform: 'ultrasonic',
        name: '%(name)s_distance' % config,
        trigger_pin: config.trigger_pin,
        echo_pin: config.echo_pin,
      } + $.sensor_update_params(config),
    ],
  },
  uptime_sensor(config):: {
    sensor+: [
      {
        platform: 'uptime',
        name: '%(name)s_uptime' % config,
      } + $.sensor_update_params(config),
    ],
  },
  homeassistant_text_sensor(config):: {
    text_sensor+: [
      {
        platform: 'homeassistant',
        name: config.name,
        entity_id: config.entity_id,
      } + $.text_sensor_params(config),
    ],
  },
  version_sensor(config):: {
    text_sensor+: [
      {
        platform: 'version',
        name: '%(name)s_version' % config,
      } + $.text_sensor_params(config),
    ],
  },
  vl53l0x_sensor(config):: {
    sensor+: [
      {
        platform: 'vl53l0x',
        name: '%(name)s_distance' % config,
      } + $.i2c_params(config, 41, '0x29'),
    ],
  },
  wifi_info_sensor(config):: {
    text_sensor+: [
      {
        platform: 'wifi_info',
        ip_address: {
          name: '%(name)s_ip_address' % config,
        },
        ssid: {
          name: '%(name)s_ssid' % config,
        },
        bssid: {
          name: '%(name)s_bssid' % config,
        },
      } + $.text_sensor_params(config),
    ],
  },
  wifi_signal_sensor(config):: {
    sensor+: [
      {
        platform: 'wifi_signal',
        name: '%(name)s_wifi_signal' % config,
      } + $.sensor_update_params(config),
    ],
  },
  xiaomi_miflora_sensor(config):: {
    sensor+: [
      {
        platform: 'xiaomi_hhccjcy01',
        mac_address: config.mac_address,
        temperature: {
          name: '%(name)s_ambient_temperature' % config,
        },
        moisture: {
          name: '%(name)s_soil_moisture' % config,
        },
        illuminance: {
          name: '%(name)s_light_intensity' % config,
        },
        conductivity: {
          name: '%(name)s_soil_conductivity' % config,
        },
      } + $.sensor_params(config),
    ],
  },
  xiaomi_mijia_sensor(config):: {
    sensor+: [
      {
        platform: 'xiaomi_lywsdcgq',
        mac_address: config.mac_address,
        temperature: {
          name: '%(name)s_temperature' % config,
        },
        humidity: {
          name: '%(name)s_humidity' % config,
        },
        battery_level: {
          name: '%(name)s_battery_level' % config,
        },
      } + $.sensor_params(config),
    ],
  },

}
