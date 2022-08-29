
Feature: Log in an user
  As QA automation
  I want to login with a valid and invalid username

  Background: Consume the service
    * url url
    * def responseBody = read('classpath:Karate/user/CreateUser/CreateUserBody.json')
  Scenario: Login with valid data
    Given path 'user', 'login'
    When method GET
    Then status 200

  Scenario Outline: Login with invalid username
    Given path 'user','login'
    And request  <username>
    When method GET
    Then status 200

    Examples:
      | username |
      | 147852     |
      | "  fishx2 "   |