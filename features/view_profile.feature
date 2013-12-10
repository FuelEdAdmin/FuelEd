Feature: View profile

  As a client/intern
  So I can update my personal information
  I want be able to view my profile

Background:
  When I go to the homepage
  And I select "admin" from "rank"
  And I fill in "Name" with "admin"
  And I fill in "Email" with "admin@gmail.com"
  And I fill in "Password" with "admin"
  And I fill in "Password confirmation" with "admin"  
  And I press "Register"
  And I follow "View & Create Accounts"
  And I follow "Create New Accounts"
  And I select "intern" from "rank"
  And I fill in "Name" with "intern"
  And I fill in "Email" with "intern@gmail.com"
  And I fill in "Password" with "intern"
  And I fill in "Password confirmation" with "intern"  
  And I press "Register"  
  Then I follow "signout"

Scenario: View profile
  When I fill in "auth_key" with "intern@gmail.com"
  And I fill in "password" with "intern"
  And I press "LOGIN"
  And I follow "profile"
  Then I should see "Name" 
  And I should see "intern"
  And I should see "Email"
  And I should see "intern@gmail.com"
  And I should see "Bio"
  And I should see "Edit Profile"
