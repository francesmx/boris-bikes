require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?}
end

describe '#report_broken' do
  it 'allows the user to report that a bike is broken' do
    subject.report_broken(Bike.new)
    expect { subject.working? == false }
  end
end
