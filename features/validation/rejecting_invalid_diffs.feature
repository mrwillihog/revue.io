Feature: Rejecting invalid diffs

  As an uploader
  I want to have invalid diffs rejected
  So that I can identify any issues with my diff

  Scenario Outline: Any invalid diff should be rejected
    Given <invalid_diff>
    When I save it
    Then it should be invalid
    And it should not be persisted to the database

  Examples:
    | invalid_diff |
    | a diff with no content |
    | a diff with no original file header |
    | a diff with no modified file header |
    | a diff with no chunk header |
    | a diff with no modifications |