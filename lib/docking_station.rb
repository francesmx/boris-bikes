require_relative 'bike'

class DockingStation
  #attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike is broken' if @bikes[0].broken? == true
    bikes.pop
  end

  def dock bike
    fail 'Docking station full' if full?
    if bike.broken? == true
      @broken_bikes << bike
    else
      @bikes << bike
    end
  end

  private
  attr_reader :bikes

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end
end
