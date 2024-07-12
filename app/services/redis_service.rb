class RedisService < CommonService
  def self.status
    CommonService::AVAILABLE if client.ping == 'PONG'
  rescue
    CommonService::UNAVAILABLE
  end

  def self.client
    @client ||= begin
      host = ENV.fetch('REDIS_HOST', '0.0.0.0')
      Redis.new(host: host, port: 6379)
    end
  end
end
