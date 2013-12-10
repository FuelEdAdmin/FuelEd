Feature: Adding an appointment

  As a client/teacher
  So that I can organize my meetings with a counselor
  I want to make a new appointment on my schedule

Background:
  When I go to the homepage
  And I select "admin" from "rank"
  And I fill in "Name" with "admin"
  And I fill in "Email" with "admin@gmail.com"
  And I fill in "Password" with "admin"
  And I fill in "Password confirmation" with "admin"  
  And I press "Register"
  And I follow "View & Create Accounts"
  Then I follow "Create New Accounts"
  When I select "intern" from "rank"
  And I fill in "Name" with "intern"
  And I fill in "Email" with "intern@gmail.com"
  And I fill in "Password" with "intern"
  And I fill in "Password confirmation" with "intern"  
  And I press "Register"

  And I follow "School Information"
  And I follow "Add New School"
  And I fill in "Name" with "UC Berkeley"
  And I fill in "Country" with "USA"
  And I fill in "County" with "Alameda"
  And I fill in "State" with "CA"
  And I fill in "City" with "Berkeley"
  And I fill in "Street Address" with "Address"
  And I fill in "Zip Code" with "94720"
  And I press "Add School"

  And I follow "signout"
  And I fill in "auth_key" with "intern@gmail.com"
  And I fill in "password" with "intern"
  And I press "LOGIN"
  And I follow "Create Appointment Slots"
  And I fill in "Client" with "Stephanie Tung"
  And I fill in "Intern" with "Christine Loh"
  And I fill in "School" with "UC Berkeley"

 Scenario: Add an appointment
  When I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "1400"
  And I fill in "End" with "1450"
  #And I press "Create"
  #Then I should see "Stephanie Tung"
  #Then I should see "Christine Loh"
  #Then I should see "1400"
  #Then I should see "1450"

Scenario: Add an appointment (unhappy - bad time argument)
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "1400"
  And I fill in "End" with "1300"
  #And I press "Create"
  #Then I should be on the appointments homepage
  #Then I should see "Start Time format incorrect"

Scenario: Add an appointment (unhappy - bad time argument)
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "-7"
  And I fill in "End" with "1450"
  #And I press "Create"
  #Then I should be on the appointments homepage
  #Then I should see "Date format incorrect"
  
