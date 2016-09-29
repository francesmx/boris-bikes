require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Dock is full" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end

#station = DockingStation.new
#bike = Bike.new
#station.dock(bike)
#station.dock(bike)
#station.release_bike
