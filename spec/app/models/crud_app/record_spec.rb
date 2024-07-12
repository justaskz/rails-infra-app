RSpec.describe CrudApp::Record do
  subject(:record) { create(:record) }

  specify do
    expect(record.version).to eq(1)
    expect(record.worker_id).to eq(1)
  end
end
