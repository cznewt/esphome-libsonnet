// https://esphome.io/components/mqtt.html
{
  new(
    config,
  )::
    {
      broker: config.mqtt_host,
      [if std.objectHas(config, 'mqtt_port') then 'port']: config.mqtt_broker.port,
      [if std.objectHas(config, 'mqtt_username') then 'username']: config.mqtt_username,
      [if std.objectHas(config, 'mqtt_password') then 'password']: config.mqtt_password,
      [if std.objectHas(config, 'mqtt_client_id') then 'client_id']: config.mqtt_client_id,
    },
}
