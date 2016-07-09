Rails.application.configure do

  ENV['SECRET_KEY_BASE'] = '43216743946462dbfb707c1d6a43ae8ca046fa2ee650d0bf505219c77e8dd1be8b03a2a1b8593dc6c76b70cb8ff0b796459b2dbef1e17d105d09bdb4559dc4ee'
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  # config.serve_static_files = false #ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.public_file_server.enabled = false
  config.assets.js_compressor = :uglifier
  # config.assets.compile = false
  config.assets.digest = true

  # config.assets.css_compressor = :yui

  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false

  config.assets.compile = true
  config.assets.precompile =  ['*.js', '*.scss', '*.css.erb']
end
