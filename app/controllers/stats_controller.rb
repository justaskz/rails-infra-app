class StatsController < ApplicationController
  def status
    @hostname = Socket.gethostname
    @schema_status = schema_status
  end

  private

  def schema_status
    Record.count && 'available'
  rescue
    'unavailable'
  end
end
