{
  timer_switch_service(config):: {
    api_service+: [
      {
        service: config.name,
        variables: {
          interval: 'int',
        },
        'then': [
          {
            'switch.turn_on': {
              id: config.switch,
            },
          },
          {
            'logger.log': {
              format: 'Service ' + config.name + ' turned on ' + config.switch + ' for %ds.',
              args: 'interval',
            },
          },
          {
            delay: '!lambda "return interval * 1000;"',
          },
          {
            'switch.turn_off': config.switch,
          },
          {
            'logger.log': 'Service ' + config.name + ' turned off ' + config.switch + '.',
          },
          /*
          {
            lambda: |||
              id(%(name)s).write(angle / 90.0);
              ESP_LOGD("api_set_angle_%(name)s", "Set angle of servo %(name)s");
            ||| % config,
          },
          */
        ],
      },
    ],
  },
}
