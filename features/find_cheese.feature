Feature: Finding with Google

  Scenario: Finding some cheese

    Given I am on the Google search page
    When I search for cheese
    Then the page title should start with cheese