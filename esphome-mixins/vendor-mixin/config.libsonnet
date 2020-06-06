local entity = (import 'entity.libsonnet');
local sonoff_entity = (import 'entity/sonoff.libsonnet');
local allbot_entity = (import 'entity/allbot.libsonnet');

{
  _config+:: {
    platform+: {
      sonoff_s20_switch: {
        platform: 'ESP8266',
        board: 'esp01_1m',
      },
      sonoff_s26_switch: {
        platform: 'ESP8266',
        board: 'esp01_1m',
      },
      sonoff_4ch_pro_r2_switch: {
        platform: 'ESP8266',
        board: 'esp01_1m',
      },
    },
    entity+: {
      sonoff_4ch_pro_r2_switch: sonoff_entity.sonoff_4ch_pro_r2_switch_entities,
      sonoff_s20_switch: sonoff_entity.sonoff_s20_switch_entities,
      sonoff_s26_switch: sonoff_entity.sonoff_s26_switch_entities,
      sonoff_mini_switch: sonoff_entity.sonoff_mini_switch_entities,
      generic_rgbw_light: entity.generic_rgbw_light_entities,
    },
  },
}
