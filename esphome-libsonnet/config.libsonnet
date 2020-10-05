// https://esphome.io/components/api.html
// https://esphome.io/components/ota.html

local esphome = {
  esphome: import 'esphome.libsonnet',
  mqtt: import 'mqtt.libsonnet',
  wifi: import 'wifi.libsonnet',
};

local list_domains = [
  'ads1115',
  'api_service',
  'binary_sensor',
  'climate',
  'cover',
  'dallas',
  'display',
  'fan',
  'font',
  'i2c',
  'image',
  'interval',
  'light',
  'output',
  'pca9685',
  'pcf8574',
  'power_supply',
  'sensor',
  'servo',
  'stepper',
  'switch',
  'text_sensor',
  'time',
  'tlc59208f',
];

local single_domains = [
  'esp32_ble_tracker',
  'esp32_camera',
  'pn532',
  'spi',
  'status_led',
  'uart',
];

local core_defaults = {
  run_duration: null,
  sleep_duration: null,
  api_password: null,
  ota_password: null,
  ap_password: null,
  log_level: 'DEBUG',
  domain: 'local',
};

{
  includes(
    devices={}, mixins={},
  ):: {
    [driver]: mixins._config.driver[driver]
    for driver in std.objectFields(mixins._config.driver)
  },
  new(
    devices={}, networks={}, mixins={},
  ):: {
    [device + '.yaml']:
      local device_list_domains = {
        [domain]: std.flattenArrays([
          mixins._config.entity[mixin.kind](mixin { raw_name: if std.objectHas(mixin, 'name') then mixin.name else 'undefined', name: if std.objectHas(mixin, 'name') then mixin.name else device })[domain]
          for mixin in (devices[device].mixins + if std.objectHas(devices[device], 'base_mixins') then devices[device].base_mixins else [])
          if std.objectHas(mixins._config.entity[mixin.kind](mixin { name: if std.objectHas(mixin, 'name') then mixin.name else device }), domain)
        ])
        for domain in list_domains
      };
      std.manifestYamlDoc({
        esphome:
          esphome.esphome.new(devices[device] { name: device }, mixins),
        [if std.objectHas(devices[device], 'mqtt') then 'mqtt']:
          esphome.mqtt.new(devices[device] { name: device }),
        [if std.objectHas(devices[device], 'networks') then 'wifi']:
          esphome.wifi.new(devices[device] { name: device } + core_defaults),
        [if std.objectHas(devices[device], 'networks') && (core_defaults + devices[device] + devices[device].networks[0]).api_password != null then 'api']: {
          password: (devices[device] + devices[device].networks[0]).api_password,
          [if std.objectHas(devices[device], 'api_port') then 'port']:
            devices[device].api_port,
          [if std.length(device_list_domains['api_service']) > 0 then 'services']:
            device_list_domains['api_service']
        },
        [if std.objectHas(devices[device], 'networks') && (core_defaults + devices[device] + devices[device].networks[0]).ota_password != null then 'ota']: {
          safe_mode: true,
          password: (devices[device] + devices[device].networks[0]).ota_password,
        },
        [if (core_defaults + devices[device]).log_level != null then 'logger']: {
          level: (core_defaults + devices[device]).log_level,
          [if esphome.esphome.board_platforms[devices[device].board] == 'ESP8266' then 'esp8266_store_log_strings_in_flash']: false,
        },
        [if (core_defaults + devices[device]).sleep_duration != null then 'deep_sleep']: {
          run_duration: (core_defaults + devices[device]).run_duration,
          sleep_duration: (core_defaults + devices[device]).sleep_duration,
        },
      } + {
        [domain]: device_list_domains[domain]
        for domain in std.objectFields(device_list_domains)
        if std.length(device_list_domains[domain]) > 0
        if domain != "api_service"
      } + {
        [if std.objectHas(mixins._config.entity[mixin.kind](mixin), domain) then domain]: mixins._config.entity[mixin.kind](mixin)[domain]
        for domain in single_domains
        for mixin in (devices[device].mixins + if std.objectHas(devices[device], 'base_mixins') then devices[device].base_mixins else [])
      })
    for device in std.objectFields(devices)
    if !std.objectHas(devices[device], 'raw_config')
  } + {
    ['%(id)s.yaml' % device]: std.manifestYamlDoc(devices[device].raw_config)
    for device in std.objectFields(devices)
    if std.objectHas(devices[device], 'raw_config')
  },

}
