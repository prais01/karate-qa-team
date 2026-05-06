Feature: prueba de store
  Scenario: CP01-
    Given url "https://petstore.swagger.io/v2"
    And path "/pet/findByStatus"
    When method get
    Then status 200
  