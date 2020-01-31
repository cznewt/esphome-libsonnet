local config = import '../../esphome-libsonnet/config.libsonnet';

local parameters = {
  core: {
    name: 'device-01',
    log_level: 'info',
  },
};

config.new(
  devices={
    device_01: parameters,
  },
)
