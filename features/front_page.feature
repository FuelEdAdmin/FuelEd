Feature: Login to the scheduler app

  As a user,
  So that I can fully utilize all aspects of the website,
  I want to have a visually appealing starting point where all features of the website are reachable.

Background:
  Given the following users exist:
  | name          | provider | email                  |
  | Ben Bitdiddle | identity | BenBitdiddle@gmail.com |
  Given the following identities exist:
  | name          | email                  | password_digest |
  | Ben Bitdiddle | BenBitdiddle@gmail.com | mypassword      |

Scenario: see login page if not logged in
  Given I am on the homepage
  And I am not logged in
  Then I should be on "index.html"

Scenario: can see front page if logged in
  Given I am on the homepage
  And I am logged in as "BenBitdiddle"
  Then I should be on "index.html"

Scenario: login to scheduler (happy)
  Given I am on the homepage
  And I am not logged in
  When I fill in "EMAIL" with "BenBitdiddle@gmail.com"
  And I fill in "PASSWORD" with "mypassword"
  And I press "LOGIN"
  Then I should be on "SIGN OUT"

Scenario: failed login (unhappy)
  Given I am on the homepage
  And I am not logged in
  When I fill in "EMAIL" with "BenBitdiddle@gmail.com"
  And I fill in "PASSWORD" with "notmypassword"
  And I press "LOGIN"
  Then I should see "Login was unsuccessful"
