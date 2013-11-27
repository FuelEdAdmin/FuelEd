require 'spec_helper'

describe AppointmentsController do

  before :each do
    @fake_appt = { :id => 1, :client => "Stephanie Tung", :intern => "Christine Loh", :room => "42" }
    @appt = Appointment.create(:id => 1, :client => "Stephanie Tung", :intern => "Christine Loh", :room => "42")
  end

  context "while logged in" do

    before :each do
      @fake_user = double("user", :id => 1)
      session[:user_id] = @fake_user.id
      User.stub(:find_by_uid).and_return(@fake_user)
    end

    describe "adding an appointment" do
      it "should call create method in Appointment model" do
        @fake_appt.stub(:permit)
        Appointment.should_receive(:create).and_return(@appt)
        get :create, {:appointment => @fake_appt}
      end
      it "should redirect to the appt details page" do
        Appointment.stub(:create).and_return(@appt)
        get :create, {:appointment => @fake_appt}
        response.should redirect_to "/appointments/#{@fake_appt[:id]}"
      end
    end

    describe "viewing an appointment" do
      it "should redirect to appt details page" do
        Appointment.stub(:find).and_return(@appt)
        get :show, {:id => @fake_appt[:id]}
        response.should render_template :show
      end
    end

  end

  context "while not logged in" do

    describe "trying to access appointment pages" do
      it "should redirect to login page (create)" do
        get :create, {:appointment => @fake_appt}
        response.should redirect_to "/"
      end
      it "should redirect to login page (index)" do
        get :index
        response.should redirect_to "/"
      end
      it "should redirect to login page (show)" do
        get :show, {:id => @fake_appt[:id]}
        response.should redirect_to "/"
      end
    end

  end

end
