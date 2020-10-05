local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      ai_thinker_camera: entity.ai_thinker_camera,
      ttgo_t_camera_v17_camera: entity.ttgo_t_journal_camera,
      ttgo_t_journal_camera: entity.ttgo_t_journal_camera,
    },
  },
}
