Feature: Posting a code review using the API

  As an uploader
  I want to be able to post reviews using an API
  So that I can use revue from the command line and other tools

  Scenario: A review is posted successfully

    Given I have a valid diff file
    When I post it via the API
    Then I should recieve a URL as a response