# require 'kafka'

class EventsApp::Main
  def self.produce
    kafka = Kafka.new(['node1:9092'], client_id: 'infra-test-app')

    kafka.deliver_message('Hello, World!', topic: 'messages')
  end

  def self.consume
    kafka = Kafka.new(['node1:9092'], client_id: 'infra-test-app')

    kafka.each_message(topic: 'messages') { |message| puts message.offset, message.key, message.value }
  end
end
