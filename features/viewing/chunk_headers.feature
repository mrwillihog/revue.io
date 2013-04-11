Feature: Displaying chunk headers

  As a reviewer
  I want to see the chunk header of each chunk
  So that I can easily identify where in the file the changes were made

  Scenario: A simple review

    A simple review is defined as a review with a single diff

    Given a simple review
    When I am reviewing it
    Then I should see the following chunk header:
      | @@ -1,6 +1,5 @@ |

  Scenario: A review with a single diff but multiple chunks

    Given a single diff but multiple chunks review
    When I am reviewing it
    Then I should see the following chunk headers:
      | @@ -1,7 +1,7 @@   |
      | @@ -15,6 +15,6 @@ |

  Scenario: A review with multiple diffs

    Given a multiple diffs review
    When I am reviewing it
    Then I should see the following chunk headers:
      | @@ -1 +1 @@ |
      | @@ -1 +1 @@ |
      | @@ -1 +1 @@ |
