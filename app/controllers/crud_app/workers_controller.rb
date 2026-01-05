class CrudApp::WorkersController < ApplicationController
  def create
    worker = CrudApp::Workers::Create.run(job_type)
    CrudApp::Workers::Worker.perform_async(worker.id, job_type)

    redirect_to(stats_path)
  end

  def update
    CrudApp::Workers::Update.for(worker_id)
    CrudApp::Workers::Worker.perform_async(worker_id, job_type)

    redirect_to(stats_path)
  end

  def destroy
    CrudApp::Workers::Delete.for(worker_id)

    redirect_to(stats_path)
  end

  private

  def job_type
    params.require(:job_type).to_i
  end

  def worker_id
    params.require(:id)
  end
end
