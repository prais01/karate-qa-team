Feature: casos de prueba USER

  Scenario: CP01 - Crear usuario
    Given url "https://petstore.swagger.io/v2"
    And path "/user/createWithList"
    And request
    """
    [
      {
        "id": 4,
        "username": "oliver",
        "firstName": "atom",
        "lastName": "niupi",
        "email": "oliver@gmail.com",
        "password": "123456",
        "phone": "978541028",
        "userStatus": 0
      }
    ]
    """
    When method post
    Then status 200
    And match response.code == 200
    And match response.message == "ok"

  Scenario: CP02 - Consultar usuario
    * def username = "oliver"
    Given url "https://petstore.swagger.io/v2"
    And path "/user/"+ username
    When method get
    Then status 200
    And match response.username == "oliver"
    And match response.id == 3

  Scenario: CP03 - Consultar login usuario
    * def username = "oliver"
    * def password = 123456
    Given url "https://petstore.swagger.io/v2"
    And path "/user/login"
    And params { username: '#(username)', password: '#(password)' }
    When method get
    Then status 200
    And match response.code == 200
