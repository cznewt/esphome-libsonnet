local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      ssd1306_display: entity.ssd1306_display_entities,
    },
  },
}
