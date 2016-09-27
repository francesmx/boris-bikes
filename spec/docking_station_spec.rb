require 'docking_station'

describe DockingStation do
  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it "creates a Bike object" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "can dock a bike" do
    expect(subject).to respond_to :dock
  end
end
