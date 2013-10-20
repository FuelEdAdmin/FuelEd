Feature: User Portal front page

  As a user,
  So that I can fully utilize all aspects of the website,
  I want to have a visually appealing starting point where all features of the website are reachable.

Scenario: see login page if not logged in
  Given I am on the FuelEd Scheduler homepage
  And I am not logged in
  Then I should be on "login.html"

Scenario: can see front page if logged in
  Given I am on the FuelEd Scheduler homepage
  And I am logged in as "BenBitdiddle"
  Then I should be on "index.html"

Scenario: login to scheduler (happy)
  Given I am on the FuelEd Scheduler homepage
  And I am not logged in
  When I fill in "username" with "BenBitdiddle"
  And I fill in "password" with "mypassword"
  And I press "login_submit"
  Then I should be on "index.html"
