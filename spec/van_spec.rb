require 'van'

describe Van do

  let(:working_bike) { double :bike, broken?: false }
  let(:broken_bike) { double :bike, broken?: true }
  let(:bike_array) { double [:bike1, :bike2, :bike3] }
  let(:working_bike_array) { [working_bike, working_bike, working_bike] }

  context 'loads broken bikes from docking station' do

    describe '#load' do

      it 'loads a broken bike from docking station' do
        expect(subject.load(broken_bike)).to eq [broken_bike]
      end

      it 'loads all broken bikes from a docking station' do
        expect(subject.load(bike_array)).to eq [bike_array]
      end

      it 'won\'t accept more than the default capacity' do
        subject.load(broken_bike)
        subject.load(broken_bike)
        expect{subject.load(broken_bike)}.to raise_error "Van capacity has been reached"
      end

    end

    describe '#unload' do

      it 'unloads a broken bike to the garage' do
        subject.load(broken_bike)
        expect(subject.unload).to eq []
      end

      it 'unloads all bikes to the garage' do
        subject.load(broken_bike)
        subject.load(broken_bike)
        expect(subject.unload).to eq []
      end

    end
  end

  context 'loads working bikes from garage' do

    it 'loads a working bike from garage' do
      expect(subject.load(working_bike)).to eq [working_bike]
    end

    it 'loads all working bikes from garage' do
      expect(subject.load(working_bike_array)).to eq [working_bike_array]
    end

  end

end
