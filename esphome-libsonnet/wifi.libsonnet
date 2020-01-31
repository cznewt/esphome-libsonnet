// https://esphome.io/components/wifi.html

{
  new(
    config,
  )::
    {
      ssid: config.wireless_essid,
      password: config.wireless_key,
      domain: '.' + config.domain,
      fast_connect: true,
      [if std.objectHas(config, 'interface_address') then 'manual_ip']: {
        static_ip: config.interface_address,
        gateway: config.interface_gateway,
        subnet: config.interface_netmask,
      },
    },
}
