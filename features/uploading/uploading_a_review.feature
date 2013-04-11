Feature: Uploading a review to the website

  As an uploader
  I want to be able to upload a diff
  So that my colleagues can easily code review it for me

  Scenario: Uploading a single diff review

    Given I am on the homepage
    And I have a valid diff file
    When I paste my diff file into the text box
    And I click upload
    Then I should be redirected to a page showing my review

  Scenario: Uploading an invalid diff file

    Given I am on the homepage
    And I have an invalid diff file
    When I paste my diff file into the text box
    And I click upload
    Then I should be redirected to the homepage
    And I should see an error message