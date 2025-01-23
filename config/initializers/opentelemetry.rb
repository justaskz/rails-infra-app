return unless ENV.fetch('OTEL_EXPORTER_ENABLED') == 'true'
return unless ENV.fetch('OTEL_EXPORTER_OTLP_ENDPOINT')
return if Rails.env.test?

require 'opentelemetry/sdk'
require 'opentelemetry-exporter-otlp'
require 'opentelemetry-instrumentation-action_view'
require 'opentelemetry-instrumentation-active_record'
require 'opentelemetry-instrumentation-http'
require 'opentelemetry-instrumentation-mysql2'
require 'opentelemetry-instrumentation-net_http'
require 'opentelemetry-instrumentation-rack'
require 'opentelemetry-instrumentation-rails'

require 'opentelemetry-metrics-sdk'
require 'opentelemetry-exporter-otlp-metrics'

OpenTelemetry::SDK.configure do |config|
  config.service_name = 'infra-app'

  config.use 'OpenTelemetry::Instrumentation::ActionView'
  config.use 'OpenTelemetry::Instrumentation::ActiveRecord'
  config.use 'OpenTelemetry::Instrumentation::Http'
  config.use 'OpenTelemetry::Instrumentation::Mysql2'
  config.use 'OpenTelemetry::Instrumentation::NetHttp'
  config.use 'OpenTelemetry::Instrumentation::Rack'
  config.use 'OpenTelemetry::Instrumentation::Rails'
end
