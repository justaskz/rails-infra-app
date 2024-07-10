class StatusesController < ApplicationController
  def show
    @services ||= services
    @hostname ||= Socket.gethostname
    @http_echo_response ||= http_echo
  end

  private

  def services
    OpenStruct.new(
      mysql: MysqlService,
      redis: RedisService,
      cassandra: CassandraService
    )
  end

  def http_echo
    Faraday.get(ENV.fetch('HTTP_ECHO_URL'))
  end
end
