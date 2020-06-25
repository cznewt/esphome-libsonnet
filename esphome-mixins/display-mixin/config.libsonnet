local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      ttf_font: entity.ttf_font,
      nextion_display: entity.nextion_display,
      pcf8574_display: entity.pcf8574_display,
      ssd1306_display: entity.ssd1306_display,
      waveshare_epaper_display: entity.waveshare_epaper_display,
    },
  },
}
