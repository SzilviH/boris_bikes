require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    #!empty? ? @bikes.pop : fail("No bikes available")
    if empty?
      fail("No bikes available")
    elsif !@bikes[-1].condition
      fail("Bike is broken")
    else
      @bikes.pop
    end
  end

  def dock(bike, condition=true)
    !full? ? @bikes << bike : fail("Docking station full")
    bike.condition = condition
  end

  private
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
