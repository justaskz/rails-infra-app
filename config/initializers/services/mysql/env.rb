module Services::Mysql::Env
  module_function

  def host
    ENV.fetch('MYSQL_HOST', '0.0.0.0')
  end

  def username
    ENV.fetch('MYSQL_USERNAME', 'app')
  end

  def password
    ENV.fetch('MYSQL_PASSWORD', 'app')
  end

  def database
    ENV.fetch('MYSQL_DATABASE', 'infra_app')
  end

  def port
    ENV.fetch('MYSQL_PORT', 3306)
  end
end
