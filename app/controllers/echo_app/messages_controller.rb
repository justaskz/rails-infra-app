class EchoApp::MessagesController < ApplicationController
  def index
    render json: payload
  end

  private

  def payload
    params.permit(:echo)
  end
end
