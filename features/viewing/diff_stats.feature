Feature: Diff stats

  As a reviewer
  I want to see the additions/deletions displayed as a chart
  So that I can tell at a glance the general changes made to the file

  Scenario: A file with only additions

    Given a review of a new file
    When I am reviewing it
    Then the diff bar should be completely green

  Scenario: A file with only deletions

    Given a removed file review
    When I am reviewing it
    Then the diff bar should be completely red

  Scenario: A file with equal additions and deletions

    Given a commit revision review
    When I am reviewing it
    Then the diff bar should be half red and half green

  Scenario: A file with more deletions than additions

    Given a more deletions review
    When I am reviewing it
    Then the diff bar should be more red than green

  Scenario: A file with more additions than deletions

    Given a more additions review
    When I am reviewing it
    Then the diff bar should be more green than red
