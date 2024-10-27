require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PersonalPostcard
  class Application < Rails::Application
    config.exceptions_app = self.routes
    config.i18n.default_locale = :ja
    # 日本時間に設定
    config.time_zone = "Tokyo"
    # 以下の1行を追加（バリデーションの日本語）
    config.active_model.i18n_customize_full_message = true
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end