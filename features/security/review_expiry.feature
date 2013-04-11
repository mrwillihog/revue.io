Feature: Review expiry

  As a security-conscious uploader
  I want my code review to be automatically deleted
  So that I don't forget to tidy up after a successful review

  @slow
  Scenario: A user accesses a code review after it has expired

    Given a simple review
    And the expiry date has passed
    Then I should experience a half second delay before I get a 404 response

  Scenario: Expired reviews are removed by a task

    Given a simple review
    And the expiry date has passed
    When I run the clean expired reviews task
    Then there should be 0 reviews left

  # TODO: Running rake tasks only works once per process.
  # Scenario: Reviews that have not expired are not removed by the task

  #   Given a simple review
  #   When I run the clean expired reviews task
  #   Then there should be 1 review left