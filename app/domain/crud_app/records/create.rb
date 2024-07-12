class CrudApp::Records::Create
  def self.for(worker_id)
    CrudApp::Record.create(version: 1, worker_id: worker_id)
  end
end
