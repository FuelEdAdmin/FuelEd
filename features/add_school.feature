Feature: Adding a school

  As a client/teacher
  So I can make appointments with the right school
  I want to add a school to the available school database

Background:
  Given I am on the new school page
  When I fill in "Name" with "UC Berkeley"
  When I fill in "Country" with "USA"
  When I fill in "County" with "Alameda"
  When I fill in "State" with "CA"
  When I fill in "City" with "Berkeley"
  When I fill in "Street Address" with "Address"
  When I fill in "Zip Code" with "94720"
  And I press "Add School"

Scenario: Add a School
  Then I should see "UC Berkeley"
  Then I should see "Berkeley"
  Then I should see "CA"
  Then I should see "Alameda"
  Then I should see "94720"
  Then I should see "USA"
  Then I should see "Address"
  Then I should see "all schools"
  Then I should see "Edit"
