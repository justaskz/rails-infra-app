class HealthController < ApplicationController
  def show
    render plain: 'OK'
  end

  def metrics
    render plain: 'OK'
  end
end
