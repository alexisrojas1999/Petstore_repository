Feature: Service client PUT
  As QA automation
  I want to Update an Existing Pet
  To validate the status code and id

  Background: consume service
    * url url
  @HappyPath
  Scenario: check the service Put (UpdatePet) To see if status code is 200.
    * def requestPut = {"id": '#(id)',"category": {"id": 1,"name": '#(nameCategory)'},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 1,"name": '#(tagsName)'}],"status": "available"}
    * def responsePut = read('classpath:Karate/pet/3.UpdatePet/responsePut.json')

    Given path 'pet'
    And request requestPut
    When method put
    Then status 200
    And match response == responsePut
    And assert response.id == id
  @NegativeTest
  Scenario Outline: Update a pet with invalid category ID
    Given path 'pet'
    And request <category.id>
    When method PUT
    Then status 415

    Examples:
      | category.id |
      | "@$#%&"    |
      | "squirtle" |
      | 123.123    |