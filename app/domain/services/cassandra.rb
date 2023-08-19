# require 'cassandra'

module Services::Cassandra
  module_function

  def status
    hosts = ENV.fetch('CASSANDRA_HOSTS', '').split
    # cluster = Cassandra.cluster(hosts: hosts)
    return 'available' if hosts.size.positive?

    'not available'
  end
end
