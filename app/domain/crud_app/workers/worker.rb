module CrudApp::Workers::Worker
  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
  end

  module ClassMethods
    def run(job_type)
      worker_id = nil
      perform_async(worker_id, job_type)

      true
    end
  end

  module InstanceMethods
    def perform(worker_id, job_type)
      worker = spawn_worker(job_type) if worker_id.nil?
      worker = CrudApp::Worker.find_by(id: worker_id) if worker_id
      return false unless worker&.running?

      @worker_id = worker.id

      process(job_type)

      self.class.perform_async(@worker_id, job_type)

      true
    end

    def spawn_worker(job_type)
      CrudApp::Worker.create(job_type: job_type, is_running: true)
    end
  end
end
