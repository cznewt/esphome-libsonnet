local config = import '../../esphome-libsonnet/config.libsonnet';

local single_i2c_parameters = {
  core: {
    name: 'single-i2c',
    bus: [{
      kind: 'i2c',
      sda: 21,
      scl: 22,
      scan: true,
      id: 'i2c01',
    }],
  },
};

local multi_i2c_parameters = {
  core: {
    name: 'multi-i2c',
    bus: [
      {
        kind: 'i2c',
        sda: 21,
        scl: 22,
        scan: true,
        id: 'i2c01',
      },
      {
        kind: 'i2c',
        sda: 15,
        scl: 26,
        scan: true,
        id: 'i2c02',
      },
    ],
  },
};

config.new(
  devices={
    single_i2c: single_i2c_parameters,
    multi_i2c: multi_i2c_parameters,
  },
)
