class StatusesController < ApplicationController
  def show
    @hostname = Socket.gethostname

    render status: 503 if services.to_h.values.any?(&:unavailable?)
  end

  private

  def services
    @services ||= OpenStruct.new(
      mysql: MysqlService,
      redis: RedisService,
      cassandra: CassandraService,
    )
  end
end
