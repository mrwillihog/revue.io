Feature: Code review tokens

  As a security-conscious uploader
  I want my code review obscured by a secret token
  So that it is extremely difficult for unwanted users to find it

  @slow
  Scenario: a review is not accessible by its ID

    By default each code review will have a unique ID. It should not be possible
    to access a code review by browsing to '/:id'

    Given a simple review
    Then I should not be able to access it at '/:id'

  Scenario: a review is accessible by its secret token

    All code reviews should be accessible via their secret token. E.g:
    '/:token'

    Given a simple review
    Then I should be able to access it at '/:token'