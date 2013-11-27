require 'spec_helper'

describe UsersController do

  before :each do
    @fake_user = {:uid => 1, :name => "name", :email => "email", :created_at => "now"}
    User.create(:uid => 1, :name => "name", :email => "email", :created_at => "before")
    @fake_user_entry = User.find_by_uid(1)
  end

  describe "editing user properties" do
    it "should call correct model method with correct arg" do
      User.should_receive(:find_by_uid).with("#{@fake_user[:uid]}")
      @fake_user.stub(:permit)
      @user.stub(:update_attributes!)
      put :update, {:id => @fake_user[:uid], :user => @fake_user}
    end
    it "should call update attributes" do
      User.should_receive(:find_by_uid).with("#{@fake_user[:uid]}")
      @fake_user.stub(:permit)
      @user.should_receive(:update_attributes!)
      put :update, {:id => @fake_user[:uid], :user => @fake_user}
    end
  end

  describe "viewing a user profile" do
    it "should redirect to user details page" do
      get :show, {:id => @fake_user[:uid]}
      response.should render_template :show
    end
  end

  describe "editing a user profile" do
    it "should redirect to user edit page" do
      @user.should_receive(:uid).twice.and_return("@fake_user[:uid]")
      ApplicationController.stub(:current_user).and_return(double("user", :uid => 1))
      get :edit, {:id => @fake_user[:uid]}
      #response.should render_template :edit
    end
  end

end
