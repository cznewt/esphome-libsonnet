# esphome-libsonnet

## Jsonnet library for generating [ESPHome][esphome] configurations

*NOTE: This project is in alpha stage. Everything may change significantly in
the following updates.*

`esphome-libsonnet` provides a simple way of defining ESPHome configuration. It
leverages the data templating language [Jsonnet][jsonnet]. It enables you to
write reusable components that you can use and reuse for multiple
configurations.

## Getting started

### Prerequisites

esphome-libsonnet requires Jsonnet.

#### Linux

You must build the binary. For details, [see the GitHub repository][jsonnetgh].

#### Mac OS X

Jsonnet is available in Homebrew. If you do not have Homebrew installed,
[install it][brew].

Then run:

```
brew install jsonnet
```

### Install esphome-libsonnet

Clone this git repository:

```
git clone https://github.com/cznewt/esphome-libsonnet.git
```

Then import the esphome-libsonnet in your jsonnet code:

```
local hass = import 'esphome-libsonnet/config.libsonnet';
```

To be able to find the esphome-libsonnet library, you must pass the root of the git
repository to esphome-libsonnet using the `-J` option:

```
jsonnet -J <path> config.jsonnet
```

As you build your own mixins/configs, you should add additional `-J` paths.

## Examples

Simple Configuration example:

```jsonnet
local config = import 'esphome-libsonnet/config.libsonnet';

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
```

Find examples in the [mixins](https://github.com/cznewt/esphome-mixins) repository.

[esphome]:https://esphome.io/
[brew]:https://brew.sh/
[jsonnet]:http://jsonnet.org/
[jsonnetgh]:https://github.com/google/jsonnet