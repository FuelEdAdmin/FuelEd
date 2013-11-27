Feature: Set Up Admin Account

  As an owner of the site
  So I set up the site for the first time
  I want to add an admin account

Background:
  
Scenario: Create Admin Account
  When I go to the homepage
  Then I should see "new account"
  And I should see "Please fill in the blanks below with the correct information."
  And I should see "Name"
  And I should see "Rank"
  And I should see "Email"
  And I should see "Password"
  And I should see "Password confirmation"
  When I select "admin" from "rank"
  And I fill in "Name" with "admin"
  And I fill in "Email" with "admin@gmail.com"
  And I fill in "Password" with "admin"
  And I fill in "Password confirmation" with "admin"  
  And I press "Register"
  Then I should see "Signed in!"
