Feature: Sleepy responses

  As a security-conscious uploader
  I want a 404 request to delay by half a second
  So that the risk of brute force is greatly reduced

  Scenario: A successful request

    Given a simple review
    Then I should not experience a delay when I view it

  @slow
  Scenario: An unsuccessful request

    Given I guess a hash
    Then I should experience a half second delay before I get a 404 response
