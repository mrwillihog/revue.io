Feature: Displaying line numbers next to diff content

  As a reviewer
  I want to see the line numbers
  So that I can quickly identify where in the file the changes were made

  Scenario: A simple review

    Given a simple review
    When I am reviewing it
    Then I should see the original line numbers 1-6
    And I should see the modified line numbers 1-5

  Scenario: A new file

    A new file will have no original line numbers. We should ensure that the
    modified line numbers start correctly

    Given a new file review
    When I am reviewing it
    Then I should see no original line numbers
    And I should see the modified line numbers 1-5

  Scenario: A removed file

    A removed file will have no modified line numbers. We should ensure that the
    original line numbers start correctly

    Given a removed file review
    When I am reviewing it
    Then I should see no modified line numbers
    And I should see the original line numbers 1-5
