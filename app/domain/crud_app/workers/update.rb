class CrudApp::Workers::Update
  include LeanInteractor

  initialize_for :worker_id

  def run
    if worker.is_running.zero?
      worker.update(is_running: 1)
    else
      worker.update(is_running: 0)
    end

    true
  end

  private

  def worker
    @worker ||= CrudApp::Worker.find(worker_id)
  end
end
