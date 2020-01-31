local config = import '../../esphome-libsonnet/config.libsonnet';

local parameters = {
  core: {
    id: 'sensor_bh1750',
    name: 'Sensor BH1750',
  },
  components: {
    sensor: {
      ['%(id)s_light' % $.core]: {
        platform: 'bh1750',
        name: '%(name)s Illuminance' % $.core,
        address: '0x23',
        update_interval: '60s',
      },
    },
  },
};

config.new(
  devices={
    sensor_bh1750: parameters,
  },
)
