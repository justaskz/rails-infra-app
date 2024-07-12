RSpec.describe CrudApp::Records::Update, '.for' do
  subject { described_class.for(worker_id) }

  let(:worker_id) { 1 }
  let!(:record) { create(:record, version: 1) }

  context 'when records exists' do
    specify do
      expect { subject }.to change { record.reload.updated_at }
      expect(subject).to eq(true)
      expect(record.reload).to have_attributes(version: 2, worker_id: worker_id)
    end
  end

  context 'when records does not exist' do
    let(:record) { nil }
    it { is_expected.to eq(nil) }
  end

  context 'when db is returning outdated data' do
    before do
      allow(CrudApp::Record).to receive(:find).with(record.id).and_return(record, old_record)
    end

    let(:old_record) { build(:record, worker_id: 1, updated_at: old_v) }
    let!(:old_v) { record.updated_at }

    specify do
      expect { subject }.to raise_error('Record version was not updated')
    end
  end
end
