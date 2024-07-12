RSpec.describe CrudApp::Records::Create, '.for' do
  subject { described_class.for(worker_id) }

  let(:worker_id) { 1 }

  specify do
    expect { subject }.to change { CrudApp::Record.count }.by(1)
    expect(CrudApp::Record.first).to have_attributes(version: 1, worker_id: worker_id)
  end
end
