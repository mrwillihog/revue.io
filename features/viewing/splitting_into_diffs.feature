Feature: Splitting a code review into multiple diffs

  As a reviewer
  I want to see each diff in its own section
  So that I can easily navigate between modified files

  Scenario: A simple review

    A simple review is defined as a review with a single diff

    Given a simple review
    When I am reviewing it
    Then I should see 1 diff section

  Scenario: A review with multiple diffs

    Given a multiple diffs review
    When I am reviewing it
    Then I should see 3 diff sections

  Scenario: A review from git

    Given a git review
    When I am reviewing it
    Then I should see 16 diff sections
    And I should see 16 chunks
    And I should see 36 additions
    And I should see 77 deletions