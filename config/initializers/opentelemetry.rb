if ENV['OTEL_EXPORTER_OTLP_ENDPOINT'] && !Rails.env.test?
  require 'opentelemetry/sdk'
  require 'opentelemetry-exporter-otlp'

  OpenTelemetry::SDK.configure do |c|
    c.service_name = 'infra-app'

    c.use 'OpenTelemetry::Instrumentation::Rails'
    c.use 'OpenTelemetry::Instrumentation::ActiveView'
    c.use 'OpenTelemetry::Instrumentation::ActiveRecord'
    c.use 'OpenTelemetry::Instrumentation::Mysql2'
  end
end
