Feature: Book appointments

  As a client
  So that I can meet with my respective intern
  I want to book an appointment 

Background:
  Given the following accounts exist:
  | Name            | Email              | Login  | Password | Rank    | School            |
  | Stephanie Tung  | admin@admin.com    | user1  | pw1      | admin   | School0           |
  | Patrick Trillo  | client1@client.com | user2  | pw2      | client  | School1           |
  | Sahana Rajasekar| intern@intern.com  | user4  | pw4      | intern  | School1           |

  And the following appointments exist:
  | Client          | Intern              | Date        | Start | End   | School  |
  |                 | Sahana Rajasekar    | 11/14/2013  | 1400  | 1500  | School1 |  

 Scenario: Book an Appointment (Client)
    When I am logged in as "user2" with password "pw2"
    And I go to the homepage
    Then I should not see "Patrick Trillo"
    When I press "Book Appointment"
    Then I should see "Booked Appointment Successfully"
    When I go to the home page
    Then I should see "Patrick Trillo"

Scenario: Book an Appointment (Intern)
    When I am logged in as "user4" with password "pw4"
    And I go to the homepage
    Then I should see "Patrick Trillo"