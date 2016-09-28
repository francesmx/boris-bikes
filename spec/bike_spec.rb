require 'bike'
require 'docking_station'

describe Bike do
  it {is_expected.to respond_to :working}

  it 'allows the user to report that a bike is broken' do
    subject { Bike.new }
    subject.report_broken
    expect { subject.working == false }
  end

  describe '#report_broken' do
    let(:bike) {Bike.new}
    it 'docks bike when reported as broken' do
      docking_station = DockingStation.new
      docking_station.capacity.times{bike.report_broken(docking_station)}
      expect {docking_station.dock(Bike.new)}.to raise_error "Docking station full"
    end
  end
end
