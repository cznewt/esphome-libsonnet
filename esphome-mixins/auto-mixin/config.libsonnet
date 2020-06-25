local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      timer_switch_service: entity.timer_switch_service,
    },
  },
}
