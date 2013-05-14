Feature: downloading a .patch

  As a reviewer
  I want to download the diff as a patch with one click
  Because I'm really lazy

  Scenario: Download link

    Given a simple review
    When I am reviewing it
    Then I should see a patch download link


  Scenario: Downloading the raw diff

    Given a simple review
    When I am reviewing it
    And I click the patch download link
    Then I should download the original diff as a patch