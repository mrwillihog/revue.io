Feature: displaying the contents of a diff

  As a reviewer
  I want to see the contents of a diff
  So that I can review the changes made to the code base

  Scenario: A simple review

    A simple review is defined as a review with a single diff

    Given a simple review
    When I am reviewing it
    Then I should see the following lines:
      |  Line 1 |
      |  Line 2 |
      |  Line 3 |
      | -Line 5 |
      | -Line 6 |
      | -Line 7 |
      | +Line 4 |
      | +Line 5 |

  Scenario: A review with multiple diffs

    Given a multiple diffs review
    When I am reviewing it
    Then I should see the following lines:
      | -testing1 |
      | +tester1  |
      | -testing2 |
      | +tester2  |
      | -testing3 |
      | +tester3  |



