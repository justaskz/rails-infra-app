module InfraApp::Global
  module_function

  def hostname
    Socket.gethostname
  end

  def revision
    @revision ||= File.read('.revision')
  end
end
