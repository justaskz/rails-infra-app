class RedisService < CommonService
  def self.status
    CommonService::AVAILABLE if App.redis.ping == 'PONG'
  rescue
    CommonService::UNAVAILABLE
  end
end
