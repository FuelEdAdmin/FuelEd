require 'spec_helper'

describe Appointment do

  before :each do
    @fake_appt = mock("appt")
  end

  describe "adding an appointment" do
    it "should call create method in Appointment model" do
      Appointment.should_receive(:create!).with(@fake_appt)
      get :create, {:appt => @fake_appt}
    end
  end

end
