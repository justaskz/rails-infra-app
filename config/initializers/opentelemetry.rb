if ENV['OTEL_EXPORTER_OTLP_ENDPOINT']
  require 'opentelemetry/sdk'
  require 'opentelemetry-exporter-otlp'

  OpenTelemetry::SDK.configure do |c|
    c.service_name = 'infra-app'
    c.use 'OpenTelemetry::Instrumentation::Rails'
    c.use 'OpenTelemetry::Instrumentation::ActiveRecord'
  end
end
