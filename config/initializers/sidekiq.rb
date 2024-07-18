Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV.fetch('REDIS_HOST', '0.0.0.0')}:6379" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV.fetch('REDIS_HOST', '0.0.0.0')}:6379" }
  config.logger.level = Logger::WARN if Rails.env == 'test'
end
