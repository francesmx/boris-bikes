require_relative 'docking_station'

class Bike
  attr_accessor :working

  def initialize
    @working = true
  end

  def report_broken (docking_station = DockingStation.new)
    self.working = false
    docking_station.dock(self)
  end
end
