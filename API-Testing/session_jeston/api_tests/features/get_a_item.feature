Feature: Get a item
  As a user I can get a item based on id

  Scenario: Get a item
    When I search for a item based on id
    Then I should get the item having that id
    Then the api status code should be 201
    Then the api response content type should be json