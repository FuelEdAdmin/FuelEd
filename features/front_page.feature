Feature: Login to the scheduler app

  As a user,
  So that I can fully utilize all aspects of the website,
  I want to have a visually appealing starting point where all features of the website are reachable.

Background:
  Given I am on the home page
  When I follow "Sign Up"
  When I fill in "Name" with "Patrick"
  And I fill in "Email" with "cs169rocks@gmail.com"
  And I fill in "Password" with "cs169"
  And I fill in "Password confirmation" with "cs169"
  And I press "Register"
  And I follow "signout"

Scenario: login to scheduler (happy)
  Given I am on the homepage
  When I fill in "auth_key" with "cs169rocks@gmail.com"
  And I fill in "password" with "cs169"
  And I press "LOGIN"
  Then I should see "Create an Appointment"

Scenario: failed login (unhappy)
  Given I am on the homepage
  When I fill in "auth_key" with "cs169rocks@gmail.com"
  And I fill in "password" with "notmypassword"
  And I press "LOGIN"
  Then I should see "Sign Up"
