module InfraApp::Otel
  module_function

  def increment
    counter.add(1)
  end

  def counter
    @counter ||= begin
      otlp_metric_exporter = OpenTelemetry::Exporter::OTLP::Metrics::MetricsExporter.new
      OpenTelemetry.meter_provider.add_metric_reader(otlp_metric_exporter)
      meter = OpenTelemetry.meter_provider.meter("SAMPLE_METER_NAME")
      meter.create_counter('counter')
    end
  end
end
