Feature: Add a item
  As a user I can delete an item

  Scenario: delete an item
    When I pass the id of the item to be deleted
    Then the item should be deleted
    Then the api status code should be 201
    Then the api response content type should be text