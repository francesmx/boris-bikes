require 'docking_station'

describe DockingStation do
  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  #it "creates a Bike object" do
  #  bike = subject.release_bike
  #  expect(bike).to be_working
  #end

  it "can dock a bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes' do
      expect{ subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.dock(Bike.new)
      expect { subject.dock Bike.new}.to raise_error 'Docking station full'
    end
  end

end
