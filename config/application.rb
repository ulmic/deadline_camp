require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(assets: %w(development test)))
end

require "configus"
require File.expand_path('../../lib/configus', __FILE__)

module DeadlineCamp
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.active_record.observers = :member_observer
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
     config.active_record.schema_format = :sql
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.generators do |g|
      g.template_engine :haml
      g.test_framework  :test_unit, fixture: true, fixture_replacement: :factory_girl
      g.stylesheets false
      g.javascripts false
    end
    config.exceptions_app = self.routes
  end
end
