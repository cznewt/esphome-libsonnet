local entity = (import 'entity.libsonnet');

# https://esphome.io/components/light/fastled.html
# https://esphome.io/components/light/neopixelbus.html

{
  _config+:: {
    entity+: {
      neopixel_light: entity.neopixel_light,
      fastled_light: entity.fastled_light,
    },
  },
}
