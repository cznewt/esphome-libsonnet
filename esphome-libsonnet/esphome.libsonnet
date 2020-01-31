// https://esphome.io/components/esphome.html

{
  new(
    config,
  )::
    {
      name: std.strReplace(config.name, '-', '_'),
      platform: if std.objectHas(config, 'platform') then config.platform else 'ESP8266',
      board: if std.objectHas(config, 'board') then config.board else 'nodemcuv2',
      [if std.objectHas(config, 'comment') then 'comment']: config.comment,
      [if std.objectHas(config, 'includes') then 'includes']: config.includes,
      [if std.objectHas(config, 'libraries') then 'libraries']: config.libraries,
      [if std.objectHas(config, 'on_boot') then 'on_boot']: config.on_boot,
      [if std.objectHas(config, 'on_shutdown') then 'on_shutdown']: config.on_shutdown,
      [if std.objectHas(config, 'on_loop') then 'on_loop']: config.on_loop,
    },
}
