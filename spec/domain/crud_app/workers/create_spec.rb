RSpec.describe CrudApp::Workers::Create, '#process' do
  subject { described_class.new.process(job_type) }

  context 'when job type is create' do
    let(:job_type) { CrudApp::Worker::CREATE }

    specify do
      expect(CrudApp::Records::Create).to receive(:for)
      expect(subject).to eq(true)
    end
  end

  context 'when job type is update' do
    let(:job_type) { CrudApp::Worker::UPDATE }

    specify do
      expect(CrudApp::Records::Update).to receive(:for)
      expect(subject).to eq(true)
    end
  end

  context 'when job type is delete' do
  end

  context 'when job type is not valid' do
    let(:job_type) { 'invalid' }

    specify do
      expect { subject }.to change(described_class.jobs, :size).by(0)
      expect(subject).to eq(false)
    end
  end
end
