source 'https://rubygems.org'

gem 'bootsnap', '~> 1.7', require: false
gem 'cassandra-driver', '~> 3.2'
gem 'faraday', '~> 2.12'
gem 'lean_interactor'
gem 'lograge'
gem 'mysql2', '~> 0.5'
gem 'opentelemetry-exporter-otlp', '~> 0.29.1'
gem 'opentelemetry-instrumentation-action_view'
gem 'opentelemetry-instrumentation-active_record'
gem 'opentelemetry-instrumentation-mysql2'
gem 'opentelemetry-instrumentation-rails'
gem 'opentelemetry-sdk', '~> 1.6'
gem 'ostruct', '~> 0.6.1'
gem 'puma', '~> 6.4'
gem 'rails', '~> 7.2'
gem 'rdkafka', '~> 0.16'
gem 'redis', '~> 5.2'
gem 'sidekiq', '~> 7.3'
gem 'sidekiq-cron'
gem 'sidekiq-failures'
gem 'sorted_set'

group :development do
  gem 'better_errors'
  # gem 'better_errors-pry'
  # gem 'binding_of_caller'
  # gem 'bullet'
  gem 'listen'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'mock_redis', '~> 0.22.0'
  gem 'rspec-its'
  gem 'rspec-rails'
end

group :development, :test do
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
end
