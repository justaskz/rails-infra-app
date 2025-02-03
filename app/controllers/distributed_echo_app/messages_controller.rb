class DistributedEchoApp::MessagesController < ApplicationController
  def index
    render json: { response: JSON.parse(service_response.body) }
  end

  private

  def service_response
    @service_response ||= begin
      service_url = ENV.fetch('SERVICE')
      url = "#{service_url}/echo?message=hello"

      Faraday.get(url)
    end
  end
end
