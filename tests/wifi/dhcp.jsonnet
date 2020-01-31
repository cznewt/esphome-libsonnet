local config = import '../../esphome-libsonnet/config.libsonnet';

local common_parameters = {
  domain: 'local-domain',
  wireless_essid: '<<wireless_essid>>',
  wireless_key: '<<wireless_key>>',
};

local device_01_parameters = {
  core: {
    name: 'device-01',
  } + common_parameters,
};

local device_02_parameters = {
  core: {
    name: 'device-02',
  } + common_parameters,
};

config.new(
  devices={
    device_01: device_01_parameters,
    device_02: device_02_parameters,
  },
)
