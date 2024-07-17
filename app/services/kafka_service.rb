class KafkaService < CommonService
  def self.status
    client.admin.metadata

    CommonService::AVAILABLE
  rescue StandardError
    CommonService::UNAVAILABLE
  end

  def self.client
    @client ||= begin
      config = { 'bootstrap.servers' => ENV.fetch('KAFKA_BOOTSTRAP_NODES', '127.0.0.1:9092') }
      Rdkafka::Config.new(config)
    end
  end
end
