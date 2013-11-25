require 'spec_helper'

describe SessionsController do

  before :each do
    @fake_user = double("user", :uid => 1, :rank => "client")
  end

  describe "creating a new session" do
    it "should call from omniauth method" do
      User.should_receive(:from_omniauth).and_return(@fake_user)
      get :create
    end
    it "should have correct id in session" do
      User.stub(:from_omniauth).and_return(@fake_user)
      get :create
      session[:user_id].should == @fake_user.uid
    end
  end

  describe "deleting a session" do
    it "should redirect to root" do
      get :destroy
      response.should redirect_to root_url notice: "Signed out!"
    end
  end

  describe "failing creating new session" do
    it "should redirect to root" do
      get :failure
      response.should redirect_to root_url
    end
  end

end
