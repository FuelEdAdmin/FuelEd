Feature: Creating an account

  As a client/teacher
  So that I can utilize the website as a user
  I want to make a new account

Background:
  Given the following users exist:
  | name  | email           | provider |
  | David | david@gmail.com | identity |

  Given the following identities exist:
  | name  | password | email           | 
  | David | booyea   | david@gmail.com | 

Scenario: Create an Account 
  Given I am on the home page
  When I press "Sign Up"
  Then I should see "New Account"
  And I should see "Name"
  And I should see "Email"
  And I should see "Password"
  And I should see "Password confirmation"
  When I fill in "Name" with "Patrick"
  And I fill in "Email" with "cs169rocks@gmail.com"
  And I fill in "Password" with "cs169"
  And I fill in "Password confirmation" with "cs169"
  And I press "Register"
  Then I should see "Account Created Successfully!"

Scenario: Password Mismatch
  Given I am on the new account page
  When I fill in "Name" with "Patrick"
  And I fill in "Email" with "cs169rocks@gmail.com"
  And I fill in "Password" with "cs169"
  And I fill in "Password confirmation" with "boooooooooo"
  And I press "Register"
  Then I should see "Password confirmation doesn't match Password"

Scenario: Email Already Used
  Given I am on the new account page
  When I fill in "Name" with "Fake David"
  And I fill in "Email" with "david@gmail.com"
  And I fill in "Password" with "cs169"
  And I fill in "Password confirmation" with "cs169"
  And I press "Register"
  Then I should see "Email has already been taken"

Scenario: Errors appear if forms left blank
  Given I am on the new account page
  And I press "Register"
  Then I should see "4 errors prohibited this account from being saved:"
  And I should see "Password can't be blank"
  And I should see "Name can't be blank"
  And I should see "Email is invalid"
