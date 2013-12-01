Feature: Show correct appointments

  As a user
  So that I can book appointments
  I want to view all appointments with all the correct information

Background:
  Given the following accounts exist:
  | Name            | Email              | Login  | Password | Rank    | School            |
  | Stephanie Tung  | admin@admin.com    | user1  | pw1      | admin   | School0           |
  | Patrick Trillo  | client1@client.com | user2  | pw2      | client  | School1           |
  | Christine Loh   | client2@client.com | user3  | pw3      | client  | School2           |
  | Sahana Rajasekar| intern@intern.com  | user4  | pw4      | intern  | School1, School2  |
  | Lewis Ren       | intern@intern.com  | user5  | pw5      | intern  | School1           |
  | David Le Brun   | intern@intern.com  | user6  | pw6      | client  | School1           |

  And the following appointments exist:
  | Client          | Intern              | Date        | Start | End   | School  |
  | Patrick Trillo  | Sahana Rajasekar    | 11/14/2013  | 1400  | 1500  | School1 |
  | Christine Loh   | Sahana Rajasekar    | 11/18/2013  | 1700  | 1800  | School2 |
  |                 | Lewis Ren           | 11/20/2013  | 1100  | 1200  | School2 |

 Scenario: View appointments logged in as Admin 
    When I am logged in as "user1" with password "pw1"
    And I go to the homepage
    Then I should see "School2"
    And I should see "Christine Loh"
    And I should see "Sahana Rajasekar"
    And I should see "11/16/2013"
    And I should see "1700"
    And I should see "1800"
    And I should see "School1"
    And I should see "Patrick Trillo"
    And I should see "11/14/2013"
    And I should see "1400"
    And I should see "1500"

 Scenario: View appointments logged in as Client 
    When I am logged in as "user2" with password "pw2"
    And I go to the homepage
    Then I should see "School1"
    And I should see "Patrick Trillo"
    And I should see "Sahana Rajasekar"
    And I should see "11/14/2013"
    And I should see "1400"
    And I should see "1500"
    And I should not see "School2"
    And I should not see "School0"
    And I should not see "11/18/2013"
    And I should not see "1700"
    And I should not see "1800"

    When I am logged in as "user3" with password "pw3"
    And I go to the homepage
    Then I should see "School2"
    And I should see "Christine Loh"
    And I should see "Sahana Rajasekar"
    And I should see "11/18/2013"
    And I should see "1700"
    And I should see "1800"
    And I should not see "School1"
    And I should not see "School0"
    And I should not see "11/14/2013"
    And I should not see "1400"
    And I should not see "1500"

 Scenario: View appointments logged in as Intern 
    When I am logged in as "user4" with password "pw4"
    And I go to the homepage
    Then I should see "School2"
    And I should see "Christine Loh"
    And I should see "Sahana Rajasekar"
    And I should see "11/16/2013"
    And I should see "1700"
    And I should see "1800"
    And I should see "School1"
    And I should see "Patrick Trillo"
    And I should see "11/14/2013"
    And I should see "1400"
    And I should see "1500"

  Scenario: View unbooked appointment (Client)
    When I am logged in as "user6" with password "pw6"
    And I go to the homepage
    Then I should see "School1"
    And I should see "Lewis Ren"
    And I should see "11/20/2013"
    And I should see "1100"
    And I should see "1200"
    And I should not see "David Le Brun"
    And I should not see "Patrick Trillo"
    And I should not see "Christine Loh" 

  Scenario: View unbooked appointment (Intern)
    When I am logged in as "user5" with password "pw5"
    And I go to the homepage
    Then I should see "School1"
    And I should see "Lewis Ren"
    And I should see "11/20/2013"
    And I should see "1100"
    And I should see "1200"
    And I should not see "David Le Brun"
    And I should not see "Patrick Trillo"
    And I should not see "Christine Loh" 