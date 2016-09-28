require_relative 'bike'

class DockingStation
  #attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes=[]
    @capacity = capacity
  end

  def release_bike
    bike_available?
    bikes.pop
  end

  def dock bike
    fail 'Docking station full' if full?
    bikes << bike
  end

  private
  attr_reader :bikes

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end

  def bike_available?
    fail 'Bike is broken' if bike.broken? == true
    fail 'No bikes available' if empty?
    true
  end
end
