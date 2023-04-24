module App
  module_function

  def redis
    @redis ||= Redis.new(host: ENV.fetch('REDIS_HOST', '0.0.0.0'), port: 6379)
  end
end
