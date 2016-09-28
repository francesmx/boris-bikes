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
    bike_available?
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

  def bike_available?
    # No bikes are available if the docking station is empty OR if all the bikes are broken
    # If bikes.count > broken_bikes.count
    fail 'All the available bikes are broken' if @broken_bikes.count >= @bikes.count
    fail 'No bikes available' if empty?
    true
  end
end
