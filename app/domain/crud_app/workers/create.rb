class CrudApp::Workers::Create
  include Sidekiq::Worker
  include CrudApp::Workers::Worker

  sidekiq_options retry: false

  def process(job_type)
    case job_type
    when CrudApp::Worker::CREATE then CrudApp::Records::Create.for(@worker_id)
    when CrudApp::Worker::UPDATE then CrudApp::Records::Update.for(@worker_id)
    # when :delete then CrudApp::Records::Delete.for(worker_id)
    else return false
    end

    true
  end
end
