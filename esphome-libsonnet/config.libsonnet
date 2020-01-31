// https://esphome.io/components/api.html
// https://esphome.io/components/ota.html

local esphome = {
  esphome: import 'esphome.libsonnet',
  mqtt: import 'mqtt.libsonnet',
  wifi: import 'wifi.libsonnet',
  component: import 'component.libsonnet',
};

local component_domains = [
  'automation',
  'binary_sensor',
  'fan',
  'light',
  'switch',
  'output',
  'sensor',
];

local core_defaults = {
  api_password: null,
  ota_password: null,
  log_level: null,
  domain: 'local',
};

{
  new(
    devices={},
  ):: {
    ['%(id)s.yaml' % device]: std.manifestYamlDoc({
      esphome:
        esphome.esphome.new(devices[device].core { id: device }),
      [if std.objectHas(devices[device].core, 'mqtt_host') then 'mqtt']:
        esphome.mqtt.new(devices[device].core { id: device }),
      [if std.objectHas(devices[device].core, 'wireless_essid') then 'wifi']:
        esphome.wifi.new(devices[device].core { id: device } + core_defaults),
      [if (core_defaults + devices[device].core).api_password != null then 'api']: {
        safe_mode: true,
        password: devices[device].core.api_password,
        [if std.objectHas(devices[device].core, 'api_port') then 'port']:
          devices[device].core.api_port,
        [if std.objectHas(devices[device].core, 'api_services') then 'services']:
          devices[device].core.api_services,
      },
      [if (core_defaults + devices[device].core).ota_password != null then 'ota']: {
        safe_mode: true,
        password: devices[device].core.ota_password,
      },
      [if (core_defaults + devices[device].core).log_level != null then 'logger']: {
        level: devices[device].core.log_level,
      },
    } + {
      [domain]: [
        esphome.component.new((devices[device].components[domain][component]) + {
          id: component,
        })
        for component in std.objectFields(devices[device].components[domain])
      ]
      for domain in component_domains
      if std.objectHas(devices[device], 'components')
      if std.objectHas(devices[device].components, domain)
    })
    for device in std.objectFields(devices)
  },
}
