class KafkaService < CommonService
  def self.status
    config = { 'bootstrap.servers' => 'redpanda:9092' }
    rdkafka = Rdkafka::Config.new(config)
    rdkafka.admin.metadata

    CommonService::AVAILABLE
  rescue StandardError
    CommonService::UNAVAILABLE
  end
end
