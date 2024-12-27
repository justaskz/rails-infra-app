class CrudApp::WorkersController < ApplicationController
  def create
    CrudApp::Workers::Create.run(job_type)

    redirect_to(crud_app_stats_path)
  end

  def destroy
    CrudApp::Workers::Delete.for(worker_id)

    redirect_to(crud_app_stats_path)
  end

  private

  def job_type
    params.require(:job_type).to_i
  end

  def worker_id
    params.require(:id)
  end
end
