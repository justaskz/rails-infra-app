source 'https://rubygems.org'

gem 'bootsnap', '~> 1.7', require: false
gem 'cassandra-driver', '~> 3.2'
gem 'lean_interactor'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.6'
gem 'rails', '~> 6.1'
gem 'redis', '~> 4.4'
gem 'ruby-kafka', '~> 1.5'
gem 'sidekiq', '~> 6.5'
gem 'sidekiq-cron'
gem 'sidekiq-failures'
gem 'sidekiq-throttled'

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
