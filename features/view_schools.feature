Feature: View all schools

  As a client/teacher
  So I can make appointments with the right school
  I want to add a school to the available school database

Background:
  Given the following schools exist:
  | name           | location       |
  | UC Berkeley    | Berkeley, CA   |
  | Stanford       | Palo Alto, CA  |
  | Ohlone College | Fremont, CA    |
  | Saratoga High  | Saratoga, CA   |

Scenario: View all schools
  When I go to the schools homepage
  Then I should see "UC Berkeley"
  Then I should see "Berkeley, CA"
  Then I should see "Stanford"
  Then I should see "Palo Alto, CA"
  Then I should see "Ohlone College"
  Then I should see "Fremont, CA"
  Then I should see "Saratoga High"
  Then I should see "Saratoga, CA"
