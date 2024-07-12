class CrudApp::Workers::Delete
  include LeanInteractor

  initialize_for :worker_id

  def run
    CrudApp::Worker.destroy(worker_id)

    true
  end
end
