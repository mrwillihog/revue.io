Feature: Splitting a diff into multiple chunks

  As a reviewer
  I want to see each diff split into chunks
  So that I can identify the different parts of the file that have been altered

  Scenario: A simple review

    A simple review is defined as a review with a single diff

    Given a simple review
    When I am reviewing it
    Then I should see 1 chunk
    And I should see the following chunk header:
      | @@ -1,6 +1,5 @@ |

  Scenario: A review with a single diff but multiple chunks

    Given a single diff but multiple chunks review
    When I am reviewing it
    Then I should see 2 chunks
    And I should see the following chunk headers:
      | @@ -1,7 +1,7 @@   |
      | @@ -15,6 +15,6 @@ |

  Scenario: A review with multiple diffs

    Given a multiple diffs review
    When I am reviewing it
    Then I should see 3 chunks
    And I should see the following chunk headers:
      | @@ -1 +1 @@ |
      | @@ -1 +1 @@ |
      | @@ -1 +1 @@ |
