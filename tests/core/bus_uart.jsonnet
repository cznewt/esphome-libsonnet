local config = import '../../esphome-libsonnet/config.libsonnet';

local parameters = {
  core: {
    name: 'device-01',
    bus: [{
      kind: 'uart',
      tx_pin: 'D0',
      rx_pin: 'D1',
      baud_rate: 9600,
    }],
  },
};

config.new(
  devices={
    device_01: parameters,
  },
)

