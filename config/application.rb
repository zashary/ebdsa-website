require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EbdsaWebsite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")


    # Simple Calendar config
    config.beginning_of_week = :sunday

    # Set default time zone to PST
    config.time_zone = 'Pacific Time (US & Canada)'

    # Handle errors with app controller
    config.exceptions_app = self.routes

    config.action_controller.default_url_options = { trailing_slash: true }
    config.middleware.use Rack::AppendTrailingSlash
  end
end
