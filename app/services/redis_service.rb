class RedisService < CommonService
  def self.status
    CommonService::AVAILABLE if App.redis.ping == 'PONG'
  rescue Redis::CannotConnectError
    CommonService::UNAVAILABLE
  end
end
