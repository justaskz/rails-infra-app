RSpec.describe CrudApp::Worker do
  subject(:worker) { create(:worker) }

  specify do
    expect(worker.job_type).to eq('creator')
    expect(worker.running?).to eq(false)
  end
end
