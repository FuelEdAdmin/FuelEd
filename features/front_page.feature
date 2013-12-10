Feature: Login to the scheduler app

  As a user,
  So that I can fully utilize all aspects of the website,
  I want to have a visually appealing starting point where all features of the website are reachable.

Background:
Scenario: login to scheduler (happy)
  Given I am on the home page
  When I select "admin" from "rank"
  And I fill in "Name" with "admin"
  And I fill in "Email" with "admin@admin.com"
  And I fill in "Password" with "admin"
  And I fill in "Password confirmation" with "admin"
  And I press "Register"
  And I follow "signout"
  Then I should see "Welcome to the FuelEd appointment scheduling portal!"
  When I fill in "auth_key" with "admin@admin.com"
  And I fill in "password" with "admin"
  And I press "LOGIN"
  Then I should see "View & Create Accounts"

Scenario: failed login (unhappy)
  Given I am on the home page
  When I select "admin" from "rank"
  When I fill in "Name" with "admin"
  And I fill in "Email" with "admin@admin.com"
  And I fill in "Password" with "admin"
  And I fill in "Password confirmation" with "admin"
  And I press "Register"
  And I follow "signout"
  Then I should see "Welcome to the FuelEd appointment scheduling portal!"
  When I fill in "auth_key" with "admin@admin.com"
  And I fill in "password" with "notmypassword"
  And I press "LOGIN"
  Then I should see "Welcome to the FuelEd appointment scheduling portal!"
