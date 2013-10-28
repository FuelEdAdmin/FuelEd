require 'spec_helper'

describe AppointmentsController do

  before :each do
    @fake_appt = double("appt", :id => 1, :client => "Stephanie Tung", :intern => "Christine Loh", :start => "1400", :end => "1450")
    @appt = Appointment.new(:id =>1, :client => "Stephanie Tung", :intern => "Christine Loh", :start => "1400", :end => "1450")
  end

  describe "adding an appointment" do
    it "should call create method in Appointment model" do
      Appointment.should_receive(:new).and_return(@appt)
      get :create, {:appointment => @fake_appt}
    end
    it "should redirect to the appt details page" do
      Appointment.stub(:new).with(@fake_appt).and_return(@appt)
      get :create, {:appointment => @fake_appt}
      response.should redirect_to "appointments/#{@fake_appt.id}"
    end
  end

end