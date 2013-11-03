Feature: Adding a school

  As a client/teacher
  So I can make appointments with the right school
  I want to add a school to the available school database

Background:
  Given I am on the new school page
  When I fill in "Name" with "UC Berkeley"
  And I fill in "Location" with "Berkeley, CA"
  And I press "Save School"

Scenario: Add a School
  Then I should see "UC Berkeley"
  Then I should see "Berkeley, CA"
