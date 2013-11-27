Feature: Adding a batch of appointments

  As a counselor
  So that I can organize my meetings with teacher participants
  I want to make a batch of new appointments on my schedule

Background:
  Given I am on the home page
  And I select "intern" from "rank"
  And I fill in "name" with "Blah"
  And I fill in "email" with "blah@blah.com"
  And I fill in "password" with "blah"
  And I fill in "password_confirmation" with "blah"
  And I press "Register"
  Given I am on the new appointment page
  And I follow "Create Batch Appointment"
  And I select "UC Berkeley" from "school"
  And I fill in "Room" with "5"

 Scenario: Add 3 appointments (happy)
  When I fill in "date" with "12/10/2014"
  And I fill in "start_time" with "1400"
  And I fill in "appointment_length" with "30"
  And I fill in "Number of Slots" with "3"
  And I press "Create Appointments"
  Then I should see "2:00"
  And I should see "2:30"
  And I should see "3:00"

 Scenario: Add negative appointment length (unhappy)
  When I fill in "date" with "12/10/2014"
  And I fill in "start_time" with "1400"
  And I fill in "appointment_length" with "-30"
  And I fill in "Number of Slots" with "3"
  And I press "Create Appointments"
  Then I should see "Error: Invalid appointment length"

 Scenario: Spillover appointments (unhappy)
  When I fill in "date" with "12/10/2014"
  And I fill in "start_time" with "2300"
  And I fill in "appointment_length" with "30"
  And I fill in "Number of Slots" with "3"
  And I press "Create Appointments"
  Then I should see "Error: Batch set spans multiple days"




