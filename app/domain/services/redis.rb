module Services::Redis
  module_function

  def status
    return 'available' if App.redis.ping == 'PONG'
  rescue Redis::CannotConnectError
    'not available'
  end
end
