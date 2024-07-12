RSpec.describe CrudApp::Workers::Worker do
  subject { TestWorker.run(job_type) }

  before do
    Sidekiq::Testing.inline!

    spy = Class.new do
      def call(job_type)
      end
    end

    worker = Class.new do
      include Sidekiq::Worker
      include CrudApp::Workers::Worker

      def process(job_type)
        Spy.new.call(job_type)
      end
    end

    stub_const('TestWorker', worker)
    stub_const('Spy', spy)
  end

  let(:job_type) { CrudApp::Worker::CREATE }

  specify do
    expect_any_instance_of(Spy).to receive(:call).with(job_type)
    expect(TestWorker).to receive(:perform_async).with(nil, job_type).and_call_original
    expect(TestWorker).to receive(:perform_async).with(2, job_type)
    expect { subject }.to change { CrudApp::Worker.count }.from(0).to(1)
    expect(subject).to eq(true)
  end

  after { Sidekiq::Testing.fake! }
end
