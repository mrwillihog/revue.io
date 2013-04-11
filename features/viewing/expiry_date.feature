Feature: Displaying the expiry date of a code review

  As a reviewer
  I want to see the expiry date
  So that I can prioritise my work

  Scenario: A simple review

    Given a simple review
    When I am reviewing it
    Then I should see the expiry date