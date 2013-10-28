require 'spec_helper'

describe Appointment do

  before :each do
    @fake_appt = { :id => 1, :client => "Stephanie Tung", :intern => "Christine Loh", :start => "1400", :end => "1450" }
  end

  describe "validating appointment input" do

    it "should not create new appointment without date" do
      Appointment.create(@fake_appt)
      Appointment.count.should_not == 1
    end

  end
end
