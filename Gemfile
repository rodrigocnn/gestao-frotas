source "https://rubygems.org"


gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

gem "faker"
gem "devise"
gem "devise-jwt"
gem "active_model_serializers", "~> 0.10.0"
gem "sidekiq"
gem "pundit"


group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "factory_bot_rails"
  gem "rspec-rails"
end
