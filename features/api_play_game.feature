@game
Feature: Playing Number Game
  As a API user
  In order to play the game
  I want to send and receive game play data
  
  Scenario: Start a Game
    Given I am a valid API user
    And I send and accept JSON
    When I send a GET request to "/api/v1/start.json"
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | id              |
      | status          |
      | message         |
      | question        |
  
  Scenario: Submit an incorrect guess
    Given I am a valid API user
    And I send and accept JSON
    And I have an existing game of id "1"
    When I send a PUT request to "/api/v1/guess.json" with the following:
    """
      {"game":{"id":"3","guess":"4"}}
    """
    Then the response code should be "200"
    And the JSON response should return "incorrect" for "status"
    And the JSON response should return "Wrong. Guess again." for "message"