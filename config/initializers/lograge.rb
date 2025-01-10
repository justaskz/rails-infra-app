Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::KeyValue.new

  config.lograge.custom_options = lambda do |event|
    {
      method: event.payload[:method],
      path: event.payload[:path],
    }
  end

  config.lograge.ignore_keys = ['format']
end
