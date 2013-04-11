Feature: retrieving a review via the API

  As a reviewer
  I want to be able to retrieve a code review via an API
  So that I can use the tools I am comfortable with to perform the review

  Scenario: Retrieving a code review that exists

    Given a simple review
    When I try to get it via the API
    Then I should recieve the diff content
    And I should recieve the expiry date

  Scenario: Retrieving a code review that doesnt exist

    Given I guess a hash
    Then I should experience a half second delay before I get a 404 response