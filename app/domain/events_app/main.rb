class EventsApp::Main
  def self.produce
  end

  def self.consume
    config = {
      :'bootstrap.servers' => ENV.fetch('KAFKA_BOOTSTRAP_NODES', '127.0.0.1:9092'),
      :'group.id' => 'ruby-test',
    }

    consumer = Rdkafka::Config.new(config).consumer
    consumer.subscribe('test')

    consumer.each do |message|
      puts "Message received: #{message}"
    end
  end
end
