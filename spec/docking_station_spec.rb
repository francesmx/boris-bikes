require 'docking_station'

describe DockingStation do

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks something' do
    bike = Bike.new
    #return the bike we dock back
    expect(subject.dock(bike)).to eq bike

  end

  it 'return docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    # we need to return the bike we just docked
    expect(subject.bike).to eq bike
  end

  it {is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

end
