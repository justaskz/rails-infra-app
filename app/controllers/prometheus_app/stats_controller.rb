class PrometheusApp::StatsController < ApplicationController
  def index
    counter = Prometheus::Client::Counter.new(:count, labels: [:infra_app], docstring: 'A counter of HTTP requests made')
    counter.increment(labels: [:infra_app])

    render json: { status: 200 }
  end
end
