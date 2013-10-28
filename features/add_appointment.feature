Feature: Adding an appointment

  As a client/teacher
  So that I can organize my meetings with a counselor
  I want to make a new appointment on my schedule

Background:
  Given I am on the new appointment page
  If I fill in "Client" with "Stephanie Tung"
  And I fill in "Intern" with "Christine Loh"

Scenario: Add an appointment
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "1400"
  And I fill in "End" with "1450"
  And I press "submit"
  Then I should see "Appointment created successfully"

Scenario: Add an appointment (unhappy - bad time argument)
  And I fill in "Date" with "12/10/2014"
  And I fill in "Start" with "1460"
  And I fill in "End" with "1500"
  And I press "submit"
  Then I should see "Start Time format incorrect"

Scenario: Add an appointment (unhappy - bad date argument)
  And I fill in "Date" with "13/10/2014"
  And I fill in "Start" with "1400"
  And I fill in "End" with "1450"
  And I press "submit"
  Then I should see "Date format incorrect"
  
