class MysqlService < CommonService
  def self.status
    CommonService::AVAILABLE if ActiveRecord::Base.connection.active?
  rescue ActiveRecord::ConnectionNotEstablished
    CommonService::UNAVAILABLE
  end

  def self.schema_status
    Record.count && CommonService::AVAILABLE
  rescue StandardError
    CommonService::UNAVAILABLE
  end
end
