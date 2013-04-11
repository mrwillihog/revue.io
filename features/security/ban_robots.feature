Feature: Ban robots

  As a security-conscious uploader
  I dont want my code reviews visited by web bots
  So that they don't end up on google

  Scenario: robots.txt disallows all pages

    Given I am viewing the robots.txt page
    Then I should see "User-Agent: *"
    And I should see "Disallow: /"