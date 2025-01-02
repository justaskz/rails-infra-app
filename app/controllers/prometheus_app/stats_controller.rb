class PrometheusApp::StatsController < ApplicationController
  def index
    Yabeda.prometheus_app.simple_count.increment(host: InfraApp::Global.hostname)
  end
end
