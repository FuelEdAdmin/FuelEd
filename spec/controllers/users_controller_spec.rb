require 'spec_helper'

describe UsersController do

  before :each do
    @fake_user = double("user")
  end

  describe "logging in" do
    it "should render login/index page if not logged in" do
      get :index
      response.should render_template :index
    end
    it "should redirect to appointments page if already logged in"
    it "should render log/index page if login was unsuccessful"
  end

  describe "adding a user" do
    it "should call create method in model" do
      User.should_receive(:create!).with(@fake_user)
      get :create, {:user => @fake_user}
    end
  end

  describe "editing user properties" do
    it "should call correct model method with correct arg"
    it "should return the correct user"
  end

end
