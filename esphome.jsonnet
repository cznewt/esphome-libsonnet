local esphome = (import 'esphome-libsonnet/config.libsonnet');
local mixins = (import 'esphome-mixins/mixins.libsonnet');

local config = (import 'esphome.json')._config;
local device = config.device;
local network = config.network;

esphome.new(devices=device, networks=network, mixins=mixins) +
esphome.includes(devices=device, mixins=mixins)
