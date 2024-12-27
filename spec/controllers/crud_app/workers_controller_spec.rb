RSpec.describe CrudApp::WorkersController do
  describe '#create' do
    subject { post(:create, params: params) }

    let(:params) { { job_type: job_type } }
    let(:job_type) { CrudApp::Worker::CREATE }

    specify do
      expect(CrudApp::Workers::Create).to receive(:run).with(job_type)
      expect(subject).to redirect_to(crud_app_stats_path)
    end
  end

  describe '#destroy' do
    subject { delete(:destroy, params: { id: worker_id }) }

    let(:worker_id) { '1' }

    specify do
      expect(CrudApp::Workers::Delete).to receive(:for).with(worker_id)
      subject
      expect(response).to have_http_status(302)
    end
  end
end
