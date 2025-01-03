class OtelApp::StatsController < ApplicationController
  def index
    InfraApp::Otel.increment
  end
end
