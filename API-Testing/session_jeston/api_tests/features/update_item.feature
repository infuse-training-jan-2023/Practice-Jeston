Feature: Update an Item
  As a user I can update an existing item

  Scenario: Update an Item
    When I pass in the details of the new item
    Then The item should be updated 
    Then the api status code should be 201
    Then the api response content type should be json