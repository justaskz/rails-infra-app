FactoryBot.define do
  factory :worker, class: CrudApp::Worker do
    job_type { 'creator' }
  end
end
