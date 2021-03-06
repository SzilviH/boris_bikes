require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}
  it {is_expected.to respond_to :bikes}

  describe "#release_bike" do

    it "should release a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "should give error when no bikes are docked and release_bike is used" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end

    it "should not release bike if bike is broken" do
      bike = Bike.new
      station = DockingStation.new
      station.dock(bike, false)
      expect {station.release_bike}.to raise_error "Bike is broken"
    end
  end

  describe "#dock" do

    it "should dock a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes[0]).to eq bike
    end

    it "should give error when more than one bike is tried to be docked" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new) }
      expect {subject.dock(Bike.new)}.to raise_error "Docking station full"
    end
  end

it "docking station should take 12 argument for capacity and equal 12" do
  station = DockingStation.new(12)
  expect(station.capacity).to eq(12)
end


end
