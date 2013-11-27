Feature: View all schools

  As a client/teacher
  So I can make appointments with the right school
  I want to add a school to the available school database

Background:
  Given the following schools exist:
  | name        |address   | city      | state | county | country | zipcode |
  | UC Berkeley |blah      | Berkeley  | CA    | blah   | USA     | 94709   |
  | Stanford    |blah      | Palo Alto | CA    | blah   | USA     | 94709   |

Scenario: View all schools
  When I go to the homepage
  And I select "admin" from "rank"
  And I fill in "Name" with "admin"
  And I fill in "Email" with "admin@gmail.com"
  And I fill in "Password" with "admin"
  And I fill in "Password confirmation" with "admin"  
  And I press "Register"
  Then I should see "School Information"
  When I go to the schools homepage
  Then I should see "UC Berkeley"
  Then I should see "Berkeley, CA"
  Then I should see "Stanford"
  Then I should see "Palo Alto, CA"
