Feature: Adding an appointment

  As a client/teacher
  So that I can organize my meetings with a counselor
  I want to make a new appointment on my schedule

Background:
  Given I am on the home page
  And I follow "Sign Up"
  And I fill in "name" with "Blah"
  And I fill in "email" with "blah@blah.com"
  And I fill in "password" with "blah"
  And I fill in "password_confirmation" with "blah"
  And I press "Register"
  Given I am on the new appointment page
  When I fill in "appointment_client" with "Stephanie Tung"
  And I fill in "appointment_intern" with "Christine Loh"

Scenario: Add an appointment
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "1400"
  And I fill in "End" with "1450"
  And I press "Create Appointment"
  Then I should see "Stephanie Tung"
  Then I should see "Christine Loh"
  Then I should see "1400"
  Then I should see "1450"

Scenario: Add an appointment (unhappy - bad time argument)
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "1400"
  And I fill in "End" with "1300"
  And I press "Create Appointment"
  Then I should be on the appointments homepage
  #Then I should see "Start Time format incorrect"

Scenario: Add an appointment (unhappy - bad time argument)
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "-7"
  And I fill in "End" with "1450"
  And I press "Create Appointment"
  Then I should be on the appointments homepage
  #Then I should see "Date format incorrect"
  
