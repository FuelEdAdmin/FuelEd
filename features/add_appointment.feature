Feature: Adding an appointment

  As a client/teacher
  So that I can organize my meetings with a counselor
  I want to make a new appointment on my schedule

Background:
  Given I am on the new appointment page
  When I fill in "Client" with "Stephanie Tung"
  And I fill in "Intern" with "Christine Loh"

Scenario: Add an appointment
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "1400"
  And I fill in "End" with "1450"
  And I press "Save Appointment"
  Then I should see "Stephanie Tung"
  Then I should see "Christine Loh"
  Then I should see "1400"
  Then I should see "1450"

Scenario: Add an appointment (unhappy - bad time argument)
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "1400"
  And I fill in "End" with "1300"
  And I press "Save Appointment"
  Then I should be on the appointments homepage
  #Then I should see "Start Time format incorrect"

Scenario: Add an appointment (unhappy - bad time argument)
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "-7"
  And I fill in "End" with "1450"
  And I press "Save Appointment"
  Then I should be on the appointments homepage
  #Then I should see "Date format incorrect"
  
