class KafkaService < CommonService
  def self.status
    config = { 'bootstrap.servers' => ENV.fetch('KAFKA_BOOTSTRAP_NODES', '127.0.0.1:9092') }
    rdkafka = Rdkafka::Config.new(config)
    rdkafka.admin.metadata

    CommonService::AVAILABLE
  rescue StandardError
    CommonService::UNAVAILABLE
  end
end
