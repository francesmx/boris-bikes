class Bike
  attr_accessor :working

  def initialize
    @working = true
  end

  def report_broken
    self.working = false
  end
end
