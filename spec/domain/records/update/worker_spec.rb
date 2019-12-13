RSpec.describe Records::Update::Worker, '#perform' do
  subject { described_class.new.perform }

  specify do
    expect(Records::Update).to receive(:run)
    expect { subject }.to change(described_class.jobs, :size).by(1)
  end
end