require 'cassandra'

module Services::Cassandra
  module_function

  def status
    cluster = Cassandra.cluster(hosts: ['cassandra-1, cassandra-2'])

    'not available'
  end
end
