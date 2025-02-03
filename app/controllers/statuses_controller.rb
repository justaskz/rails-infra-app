class StatusesController < ApplicationController
  def show
    @services ||= services
    @hostname ||= InfraApp::Global.hostname
    @revision ||= InfraApp::Global.revision
  end

  private

  def services
    OpenStruct.new(
      mysql: MysqlService,
      redis: RedisService,
      cassandra: CassandraService,
      redpanda: KafkaService
    )
  end
end
