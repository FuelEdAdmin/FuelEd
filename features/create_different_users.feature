Feature: Creating an Account

  As a administrator 
  So that I can populate the website with users
  I want to make a new account for supervisors, clients and interns

Background:
  Given I am logged into the admin panel
  When I press "Create User"

Scenario: Create an Admin account 
  When I fill in "Rank" with "Admin"
  Then I should see "Name"
  Then I should see "Email"
  Then I should see "Username"
  When I fill in "Name" with "Admin"
  And I fill in "Email" with "admin@gmail.com"
  And I fill in "Username" with "admin"
  And I press "Create"
  Then I should see "Admin Account Created Successfully"

Scenario: Create a Client account 
  When I fill in "Rank" with "Client"
  Then I should see "School"
  When I fill in "School" with "000000"
  And press "Create"
  Then I should see "Client Account Created Successfully"

Scenario: Create a Intern account
  When I fill in "Rank" with "Intern"
  Then I should see "Name"
  Then I should see "Email"
  Then I should see "Username"
  Then I should see "Schools"
  When I fill in "Name" with "Admin"
  And I fill in "Email" with "admin@gmail.com"
  And I fill in "Username" with "admin"
  And I fill in "Schools" with "000000, 000001"  
  And I press "Create"
  Then I should see "Intern Account Created Successfully"

Scenario: Errors appear if forms left blank
  When I fill in "Rank" with "Intern"
  When I fill in "Name" with ""
  And I fill in "Email" with ""
  And I fill in "Username" with ""
  And I fill in "Schools" with ""    
  And I press "Create"
  Then I should see "Name can't be blank"
  And I should see "Email can't be blank"
  And I should see "Username can't be blank"
  And I should see "Schools can't be blank"
