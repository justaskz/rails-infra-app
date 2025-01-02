class HealthController < ApplicationController
  def show
    render json: 'OK'
  end
end
