Feature: Service client PUT
  As QA automation
  I want to Update an Existing Pet
  To validate the status code and id

  Background: consume service
    * url url

  Scenario: check the service Put (UpdatePet) To see if status code is 200.
    * def requestPut = {"id": "#(id)", "category": {"id": "#(idCategory)", "name": "#(nameCategory)"},"name": "#(name)","photoUrls": ["#(photoUrls)"],"tags": [{"id": "#(idTags)","name": "#(nameTags)"}],"status": "#(status)"}
    * def responsePut = read('classpath:karate/request/responsePut.json')

    Given path 'pet'
    And request requestPut
    When method put
    Then status 200
    And match response == responsePut

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