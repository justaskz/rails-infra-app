module App
  module_function

  def redis
    @redis ||= Redis.new(host: ENV['REDIS_HOST'], port: 6379)
  end
end
