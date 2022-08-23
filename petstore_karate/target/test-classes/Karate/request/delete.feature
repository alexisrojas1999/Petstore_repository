Feature: Service client delete
  As AQ Automation
  I want to delete a pet
  to validate the Status code and ID

  Background: consume service
    * url url

  Scenario: Check the service DELETE method

    Given path 'pet', id
    When method delete
    Then status 200

  Scenario Outline: DELETE a pet with values an id in the url


    Given path 'pet', <id>
    When method DELETE
    Then status <code>
    And match response == <expected>

    Examples:
      | id    | code   | expected                                                                                               |
      |           | 405  | <?xml version="1.0" encoding="UTF-8" standalone="yes"?><apiResponse><type>unknown</type></apiResponse> |
      | "@#$%&"    | 404  | {"code": "#number","type": "#string","message": "#string"}                                             |
      | 123.123   | 404  | {"code": "#number","type": "#string","message": "#string"}                                             |
      | "testfish" | 404  | {"code": "#number","type": "#string","message": "#string"}