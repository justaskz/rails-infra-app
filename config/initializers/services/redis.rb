module Services::Redis
  module_function

  def status
    'available' if App.redis.ping == 'PONG'
  rescue Redis::CannotConnectError
    'not available'
  end
end
