class CrudApp::Workers::Worker
  include Sidekiq::Worker

  def perform(worker_id, job_type)
    return unless worker_id || job_type

    worker = CrudApp::Worker.find_by(id: worker_id)
    return false unless worker&.running?

    case job_type
    when CrudApp::Worker::CREATE then CrudApp::Records::Create.for(worker_id)
    when CrudApp::Worker::UPDATE then CrudApp::Records::Update.for(worker_id)
    # when :delete then CrudApp::Records::Delete.for(worker_id)
    else return false
    end

    self.class.perform_async(worker_id, job_type)

    true
  end
end
