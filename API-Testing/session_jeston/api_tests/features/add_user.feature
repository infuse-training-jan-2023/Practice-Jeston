Feature: Add a new User
  As a user I want to register a new user

  Scenario: Register a new user
    When I pass in the details of the new user
    Then a new user should be created
    Then the api status code should be 201
    Then the api response content type should be text