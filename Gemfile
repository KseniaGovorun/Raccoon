source "https://rubygems.org"

gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "redis", ">= 4.0.1"
gem "tailwindcss-rails", "~> 3.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "devise"
gem "faker"
gem "simple_form"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "dotenv-rails"
  gem "brakeman", require: false
  gem "rspec-rails", "~> 7.0.1"
  gem "factory_bot_rails"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "annotate"
end

group :test do
  gem "shoulda-matchers", "~> 6.2"
end
