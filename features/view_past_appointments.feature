Feature: Viewing past appointments

  As a user
  So that I can keep track of my previous appointments
  I want to view all my booked appointments that have passed

Background:
  Given the following accounts exist:
  | Name            | Email              | Login  | Password | Rank    |
  | Stephanie Tung  | admin@admin.com    | user1  | pw1      | admin   |
  | David Le Brun   | client@client.com  | user2  | pw2      | client  |
  | Christine Loh   | client1@client.com | user22 | pw22     | client  |
  | Lewis Ren       | intern@intern.com  | user3  | pw3      | intern  |
  And the following appointments exist:
  | Client          | Intern       | Date        | Start | End   |
  | David Le Brun   | Lewis Ren    | 11/14/2013  | 1400  | 1500  |
  | David Le Brun   | Lewis Ren    | 11/16/2013  | 1200  | 1300  |
  | Christine Loh   | Lewis Ren    | 11/18/2013  | 1700  | 1800  |
  And I am logged in as "David Le Brun"

 Scenario: View past appointment (exists)
    And today is "11/15/2013"
    And I am on the appointments homepage
    When I click on "View Past Appointments"
    Then I should see 1 appointment(s)
    Then I should see "Lewis Ren"
    Then I should see "11/14/2013"

 Scenario: View past appointment (none exist)
    And today is "11/10/2013"
    And I am on the appointments homepage
    When I click on "View Past Appointments"
    Then I should see 0 appointment(s)