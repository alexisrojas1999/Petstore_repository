Feature: Service client GET
  As AQ Automation
  I want to Find a Pet by its ID
  to validate the status code and ID

  Background: consume service
    * url url

@HappyPath
  Scenario: Check the service GET method
    Given path 'pet', id
    When method GET
    Then status 200

  @NegativeTest
  Scenario Outline: Find a pet by ID

    Given path 'pet', id
    And request <id>
    When method get
    Then status 404

    Examples:
      | id     |
      | "@#$%" |
      | "fish" |
      | 123.123|