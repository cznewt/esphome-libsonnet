local config = import '../../esphome-libsonnet/config.libsonnet';

local api_simple_parameters = {
  core: {
    name: 'api-simple',
    api_password: '<<api_password>>',
    wireless_essid: '<<wireless_essid>>',
    wireless_key: '<<wireless_key>>',
  },
};

config.new(
  devices={
    api_simple: api_simple_parameters,
  },
)
