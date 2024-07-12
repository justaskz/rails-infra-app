FactoryBot.define do
  factory :record, class: CrudApp::Record do
    version { 1 }
    worker_id { 1 }
  end
end
