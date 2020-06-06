// https://esphome.io/components/wifi.html

{
  new(
    config,
  ):: {
    domain: '.' + (config + config.networks[0]).domain,
    fast_connect: true,
    [if std.objectHas((config + config.networks[0]), 'address') then 'manual_ip']: {
      static_ip: (config + config.networks[0]).address,
      gateway: (config + config.networks[0]).gateway,
      subnet: (config + config.networks[0]).netmask,
    },
    networks: [
      {
        ssid: network.essid,
        password: network.key,
      }
      for network in config.networks
    ],
  },
}
