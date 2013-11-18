Feature: View all appointments

  As a client/intern
  So I can view the appointments I have scheduled
  I want to correctly view the details of each appointment

Background:
  Given the following appointments exist:
  | Client          | Intern            | Date        | Start | End   |
  | Stephanie Tung  | Christine Loh     | 11/14/2013  | 1400  | 1500  |
  | David Le Brun   | Patrick Trillo    | 11/16/2013  | 1200  | 1300  |
  | Lewis Ren       | Sahana Rajasekar  | 11/18/2013  | 1700  | 1800  |

Scenario: View all appointments
  When I go to the appointments homepage
  Then I should see "Booked by Stephanie Tung"
  Then I should see "Intern: Christine Loh"
  Then I should see "Date: 11/14/2013"
  Then I should see "Time: 1400 - 1500"
  Then I should see "Booked by David Le Brun"
  Then I should see "Intern: Patrick Trillo"
  Then I should see "Date: 11/16/2013"
  Then I should see "Time: 1200 - 1300"
  Then I should see "Booked by Lewis Ren"
  Then I should see "Intern: Sahana Rajasekar"
  Then I should see "Date: 11/18/2013"
  Then I should see "Time: 1700 - 1800"

Scenario: View an appointment individually
  When I go to the appointments homepage
  And I follow "View appointment"
  Then I should see "Stephanie Tung"
  Then I should see "Christine Loh" 
  Then I should see "11/14/2013"
  Then I should see "1400"
  Then I should see "1500"

