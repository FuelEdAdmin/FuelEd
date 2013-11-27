Feature: Creating a batch of accounts

  As a administrator 
  So that I can populate the website with a batch users
  I want to make a batch of supervisors, clients, or interns

Background:
  Given I am on the homepage
  When I select "admin" from "rank" 
  And I fill in "Name" with "Patrick" 
  And I fill in "Email" with "cs169rocks@gmail.com"
  And I fill in "Password" with "cs169"
  And I fill in "Password confirmation" with "cs169"
  And I press "Register"
  Then I follow "Create New Accounts"

Scenario: Create a batch of participant accounts 
  When I follow "Create Participant Account"
  And I select "California" from "states"
  And I select "UC Berkeley" from "schools"
  And I fill in "Number of Accounts" with "3"
  And I press "Register"
  Then I should see "User(s) created!"
  And I should see "Admin's Profile"

Scenario: Create a batch of counselor accounts 
  When I follow "Create Counselor Account"
  And I follow "Add School"
  And I select "California" from "states1"
  And I select "UC Berkeley" from "schools1"
  And I follow "Add School"
  And I select "California" from "states2"
  And I select "UC Berkeley" from "schools2"
  And I fill in "Number of Accounts" with "3"
  And I press "Register"
  Then I should see "User(s) created!"
  And I should see "Admin's Profile"