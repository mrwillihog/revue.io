Feature: viewing raw diff

  As a reviewer
  I want to see the raw diff
  So that I can apply it as a patch

  Scenario: Download link

    Given a simple review
    When I am reviewing it
    Then I should see a raw download link


  Scenario: Viewing the raw diff

    Given a simple review
    When I am reviewing it
    And I click the raw download link
    Then I should see the original diff