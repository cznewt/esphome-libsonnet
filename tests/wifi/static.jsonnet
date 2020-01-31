local config = import '../../esphome-libsonnet/config.libsonnet';

local common_parameters = {
  domain: 'local-domain',
  wireless_essid: '<<wireless_essid>>',
  wireless_key: '<<wireless_key>>',
  interface_gateway: '10.0.0.1',
  interface_netmask: '255.255.255.0',
};

local device_01_parameters = {
  core: {
    name: 'device-01',
    interface_address: '10.0.0.101',
  } + common_parameters,
};

local device_02_parameters = {
  core: {
    name: 'device-02',
    interface_address: '10.0.0.102',
  } + common_parameters,
};

config.new(
  devices={
    device_01: device_01_parameters,
    device_02: device_02_parameters,
  },
)
