source "https://rubygems.org"

ruby "2.6.3"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "graphql", "~> 1.9"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.12"
gem "rails", "~> 6.0.0"

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "graphiql-rails"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
end

group :development, :test do
  gem "factory_bot_rails", "~> 5.0"
  gem "rspec-rails", "= 4.0.0.beta2"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
