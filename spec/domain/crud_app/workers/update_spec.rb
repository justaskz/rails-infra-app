RSpec.describe CrudApp::Workers::Update, '.for' do
  subject { described_class.for(worker.id) }

  let(:worker) { create(:worker, is_running: false) }

  specify do
    expect { subject }.to change { worker.reload.is_running }.from(0).to(1)

    expect(subject).to eq(true)
  end
end
