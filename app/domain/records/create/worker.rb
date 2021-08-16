class Records::Create::Worker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_options retry: false
  # sidekiq_throttle threshold: { limit: 100, period: 1.second }

  def perform(worker_id)
    Records::Create.run(worker_id)
    return unless Workers.continue?

    Records::Create::Worker.perform_async(worker_id)
  rescue StandardError => e
    Rails.logger.error("#{Time.now.strftime("%H:%M:%S")} - message: #{e.message}, worker_id: #{worker_id}")
    Records::Create::Worker.perform_async(worker_id)
    raise
  end
end
