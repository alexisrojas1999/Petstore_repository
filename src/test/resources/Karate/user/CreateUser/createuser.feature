@createuser
Feature: Create a new user
  As QA automation
  I want to create a new user
  To validate the response and status code

  Background: Consume the service
    * url url
    * def createUserBody = read('classpath:Karate/user/CreateUser/CreateUserBody.json')
    * def createUserResponse = read('karate/user/CreateUser/createUserResponse.json')
  Scenario: Create a new user Using POST

    Given path 'user'
    And request createUserBody
    When method POST
    Then status 200
    And match response == createUserResponse


  Scenario Outline: Create user but with invalid userstatus
    Given path 'user'
    And request <userStatus>
    When method POST
    Then status 415

    Examples:
      | userStatus   |
      | "fish" |
      | 12345     |