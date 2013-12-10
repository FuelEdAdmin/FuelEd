Feature: Creating an Account

  As a administrator 
  So that I can populate the website with users
  I want to make a new account for supervisors, clients and interns

Background:
  Given I am on the homepage
  When I select "admin" from "rank" 
  And I fill in "Name" with "Patrick" 
  And I fill in "Email" with "cs169rocks@gmail.com"
  And I fill in "Password" with "cs169"
  And I fill in "Password confirmation" with "cs169"
  And I press "Register"
  And I follow "View & Create Accounts"
  Then I follow "Create New Accounts"

Scenario: Create an Admin account 
  When I select "admin" from "rank"
  And I fill in "Name" with "Admin"
  And I fill in "Email" with "admin@gmail.com"
  And I fill in "Password" with "hihihi"
  And I fill in "Password confirmation" with "hihihi"
  And I press "Register"
  Then I should see "User created!"
  And I should see "Admin's Profile"

Scenario: Create a Client account 
  When I select "client" from "rank"
  And I fill in "Name" with "Client"
  And I fill in "Email" with "client@gmail.com"
  And I fill in "Password" with "hihihi"
  And I fill in "Password confirmation" with "hihihi"
  And I press "Register"
  Then I should see "User created!" 

Scenario: Create a Intern account
  When I select "intern" from "rank"
  And I fill in "Name" with "Intern"
  And I fill in "Email" with "intern@gmail.com"
  And I fill in "Password" with "hihihi"
  And I fill in "Password confirmation" with "hihihi"
  And I press "Register"
  Then I should see "User created!"
  And I should see "Intern's Profile"

Scenario: Errors appear if forms left blank
  When I select "intern" from "rank"
  When I fill in "Name" with ""
  And I fill in "Email" with ""
  And I press "Register"
  Then I should see "Name can't be blank"
  And I should see "Email is invalid"
