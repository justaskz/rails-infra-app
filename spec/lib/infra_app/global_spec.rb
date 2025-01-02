RSpec.describe InfraApp::Global do
  describe '.hostname' do
    subject { described_class.hostname }

    it { is_expected.to eq('rails') }
  end

  describe '.revision' do
    subject { described_class.revision }

    it { is_expected.to eq("DEV\n") }
  end
end
