return unless ENV.fetch('OTEL_EXPORTER_ENABLED') == 'true'
return if Rails.env.test?
return if defined?(::Rails::Console)

require 'opentelemetry/sdk'
require 'opentelemetry-api'
require 'opentelemetry-exporter-otlp'
require 'opentelemetry-instrumentation-action_view'
require 'opentelemetry-instrumentation-active_record'
require 'opentelemetry-instrumentation-faraday'
require 'opentelemetry-instrumentation-mysql2'
require 'opentelemetry-instrumentation-net_http'
require 'opentelemetry-instrumentation-rack'
require 'opentelemetry-instrumentation-rails'

require 'opentelemetry-metrics-sdk'
require 'opentelemetry-exporter-otlp-metrics'

OpenTelemetry::SDK.configure do |config|
  config.service_name = 'infra-app'

  config.use 'OpenTelemetry::Instrumentation::Rack'
  config.use 'OpenTelemetry::Instrumentation::Rails'
  config.use 'OpenTelemetry::Instrumentation::ActionView'
  config.use 'OpenTelemetry::Instrumentation::ActiveRecord'
  config.use 'OpenTelemetry::Instrumentation::Mysql2'
  config.use 'OpenTelemetry::Instrumentation::Net::HTTP'
  config.use 'OpenTelemetry::Instrumentation::Faraday'
end
