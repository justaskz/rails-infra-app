class MysqlService < CommonService
  def self.status
    CommonService::AVAILABLE if ActiveRecord::Base.connection.active?
  rescue ActiveRecord::ConnectionNotEstablished
    CommonService::UNAVAILABLE
  end

  def self.schema_status
    ActiveRecord::Migration.check_pending! || CommonService::AVAILABLE
  rescue StandardError
    CommonService::UNAVAILABLE
  end
end
