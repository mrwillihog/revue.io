Feature: Highlighting additions and deletions

  As a reviewer
  I want to see every addition and deletion highlighted
  So that I can quickly review the differences between the original and modified files

  Scenario: A simple review

    Given a simple review
    When I am reviewing it
    Then I should see the following additions highlighted:
      | +Line 4 |
      | +Line 5 |
    And I should see the following deletions highlighted:
      | -Line 5 |
      | -Line 6 |
      | -Line 7 |

  Scenario: A review with multiple diffs

    Given a multiple diffs review
    When I am reviewing it
    Then I should see the following additions highlighted:
      | +tester1 |
      | +tester2 |
      | +tester3 |
    And I should see the following deletions highlighted:
      | -testing1 |
      | -testing2 |
      | -testing3 |