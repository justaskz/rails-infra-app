class PrometheusApp::StatsController < ApplicationController
  def index
    Yabeda.prometheus_app.simple_count.increment

    render json: { status: 200 }
  end
end
