require 'spec_helper'

describe User do

  before :each do
    @fake_user = {"provider" => 1, "uid" => 1, "info" => {"name" => "name", "email" => "email@gmail.com"}}
  end

  it "should return correct user types" do
    User::USER_TYPES.should == ["client", "intern", "admin"]
  end

  describe "adding a user" do
    it "should add in model correctly" do
      User.create_with_omniauth(@fake_user, "client")
      User.count.should == 1
    end
  end

end
