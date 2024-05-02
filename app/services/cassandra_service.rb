require 'cassandra'

class CassandraService < CommonService
  def self.status
    hosts = ENV.fetch('CASSANDRA_HOSTS', '').split
    raise if hosts.empty?

    cluster = Cassandra.cluster(hosts: hosts)
    statuses = []
    cluster.each_host { |host| statuses.push(host.status) }
    raise unless statuses.all? { |status| status == :up }

    CommonService::AVAILABLE
  rescue StandardError
    CommonService::UNAVAILABLE
  end
end
