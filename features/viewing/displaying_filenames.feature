Feature: Displaying original and modified filenames

  As a reviewer
  I want to see the original and modified filenames of a diff
  So that I can assess whether a filename has been changed

  Scenario: A simple review

    A simple review is defined as a review with a single diff

    Given a simple review
    When I am reviewing it
    Then I should see the filename "Original"

  Scenario: A review with multiple diffs

    Given a multiple diffs review
    When I am reviewing it
    Then I should see the following filenames:
      | File1 |
      | File2 |
      | File3 |