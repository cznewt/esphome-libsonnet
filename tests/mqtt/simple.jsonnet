local config = import '../../esphome-libsonnet/config.libsonnet';

local parameters = {
  core: {
    name: 'device-01',
    wireless_essid: '<<wireless_essid>>',
    wireless_key: '<<wireless_key>>',
    mqtt_host: '<<mqtt_broker>>',
  },
};

config.new(
  devices={
    device_01: parameters,
  },
)
