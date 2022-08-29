Feature: Service client POST
  As QA automation
  I want to create a pet
  To validate the status code and status

  Background: consume service
    * url url
  @HappyPath
  Scenario: Add a pet Using Post Method


    * def CreatePet = {"id": '#(id)',"category": {"id": 1,"name": '#(nameCategory)'},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 1,"name": '#(tagsName)'}],"status": "available"}
    * def responseAddPet = read('classpath:karate/pet/1.AddPet/responsePost.json')
    Given path 'pet'
    And request CreatePet
    When method POST
    Then status 200
    * match response == responseAddPet
    And assert response.id == id


  @NegativeTest
  Scenario Outline: Add a pet using a valid status

    Given path 'pet'
    And request <status>
    When method post
    Then status 415

    Examples:
      | status     |
      | "@$#%&"    |
      | "squirtle" |
      | 123.123    |
