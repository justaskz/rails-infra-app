class CrudApp::StatsController < ApplicationController
  def index
    @workers = CrudApp::Worker.all
  end
end
