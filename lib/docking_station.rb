require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    !empty? ? @bikes.pop : fail("No bikes available")
  end

  def dock(bike)
    !full? ? @bikes << bike : fail("Docking station full")
  end

  private
  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.empty?
  end
end
