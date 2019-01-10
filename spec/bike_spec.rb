require 'bike'
require 'docking_station'

describe Bike do

  it 'should take one argument of broken if needed' do
    expect(subject).to respond_to(:condition)
  end

  it 'should update bike condition when broken' do
    station = DockingStation.new
    bike = Bike.new(false)
    expect(bike.condition).to eq false
  end


end
