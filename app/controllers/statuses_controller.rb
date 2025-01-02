class StatusesController < ApplicationController
  def show
    @services ||= services
    @hostname ||= InfraApp::Global.hostname
    @http_echo_response ||= http_echo
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

  def http_echo
    url = ENV.fetch('HTTP_ECHO_URL', nil)
    return 'NOT CONFIGURED' unless url

    Faraday.get(url)
  rescue StandardError
    CommonService::UNAVAILABLE
  end
end
