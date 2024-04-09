module Services::Mysql
  module_function

  def status
    'available' if ActiveRecord::Base.connection.active?
  rescue ActiveRecord::ConnectionNotEstablished
    'not available'
  end
end
