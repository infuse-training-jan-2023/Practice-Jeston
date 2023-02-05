Feature: Add a item
  As a user I can add a new item

  Scenario: Add a item
    When I pass in the details of the new item
    Then I should get the new item inserted
    Then the api status code should be 201
    Then the api response content type should be json