require 'singleton'

class CommonService
  AVAILABLE = 'available'
  UNAVAILABLE = 'not available'

  include Singleton

  def self.available?
    status == AVAILABLE
  end

  def self.unavailable?
    !available?
  end
end
