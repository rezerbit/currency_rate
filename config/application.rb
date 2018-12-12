require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv.load(
  Bundler.root.join(
    Rails.env.development? ? '.env' : ".env.#{Rails.env}"
  )
)

module CurrencyRate
  class Application < Rails::Application
    config.i18n.load_path += Dir[config.root.join('frontend/components/**/*.yml')]
    config.autoload_paths << config.root.join('frontend/components')
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.view_specs false
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.channel assets: false
    end
  end
end
