local config = import '../../esphome-libsonnet/config.libsonnet';

local parameters = {
  core: {
    name: 'ota-01',
    ota_password: '<<ota_password>>',
    wireless_essid: '<<wireless_essid>>',
    wireless_key: '<<wireless_key>>',
  },
};

config.new(
  devices={
    device_01: parameters,
  },
)
