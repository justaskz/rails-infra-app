class MysqlService < CommonService
  def self.status
    ActiveRecord::Base.connection.active? ? CommonService::AVAILABLE : CommonService::UNAVAILABLE
  rescue ActiveRecord::ConnectionNotEstablished
    CommonService::UNAVAILABLE
  end

  def self.schema_status
    ActiveRecord::Migration.check_pending_migrations || CommonService::AVAILABLE
  rescue StandardError
    CommonService::UNAVAILABLE
  end
end
