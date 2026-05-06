Feature: casos de prueba de PET

  Scenario: CP01 - Obtener mascota con el ID version 1
    Given url "https://petstore.swagger.io/v2"
    And path "/pet/223905"
    When method get
    Then status 200
    And match response contains {"id": 223905}

  Scenario: CP02 - Obtener mascota con el ID version 2
    Given url "https://petstore.swagger.io/v2"
    * def petId = "223905"
    And path "/pet/" + petId
    When method get
    Then status 200
    And match response contains {"id": 223905}

  Scenario: CP03 - Crear mascota
    Given url "https://petstore.swagger.io/v2"
    And path "/pet"
    And request
      """
      {
          "id": 1425,
          "category": {
            "id": 0,
            "name": "string"
          },
          "name": "KIRA",
          "photoUrls": [
            "string"
          ],
          "tags": [
            {
              "id": 4,
              "name": "string"
            }
          ],
          "status": "available"
        }
      """
    When method post
    Then status 200
    And match response contains {"id": 1425}

  Scenario: CP04 - Actualizar mascota
    Given url "https://petstore.swagger.io/v2"
    And path "/pet"
    And request
    """
    {
      "id": 1425,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "PELUCHIN",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    When method put
    Then status 200
    And match response.id == 1425
    And match response.name == "PELUCHIN"
    And match response.status == "available"


  Scenario: CP05 - Validar informacion
    * def petId = 1425
    Given url "https://petstore.swagger.io/v2"
    And path "/pet/" + petId
    When method get
    Then status 200
    And match response contains {"id": 1425,"name": "PELUCHIN","status": "available"}


  Scenario: CP06 - Eliminar mascota
    * def petId = 1425
    Given url "https://petstore.swagger.io/v2"
    And path "/pet/" + petId
    And header x-api-key = "api0000"
    When method delete
    Then status 200
    And match response.code == 200









