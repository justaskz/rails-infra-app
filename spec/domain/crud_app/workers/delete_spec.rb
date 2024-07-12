RSpec.describe CrudApp::Workers::Delete, '.for' do
  subject { described_class.for(worker.id) }

  let!(:worker) { create(:worker) }

  specify do
    expect { subject }.to change { CrudApp::Worker.count }.from(1).to(0)
    expect(subject).to eq(true)
  end
end
