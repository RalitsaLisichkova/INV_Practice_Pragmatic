@test @login
Feature: Login tests http://inv.bg/login

  Background:
    Given I am at the Login page

  Scenario Outline: Cant login with invalid credentials
    When I enter username "<username>" and password "<password>" and click Login button
    Then login error message with text should be displayed "<error_message>"
    Examples:
      | username                    | password | error_message                                               |
      |                             |          | Моля, попълнете вашия email                                 |
      | ralitsalisichkova@gmail.com | 7575     | Грешно потребителско име или парола. Моля, опитайте отново. |
      | ralitsa@.com                | 111111   | Грешно потребителско име или парола. Моля, опитайте отново. |


  Scenario: Can login with valid credentials
    When I enter username "ralitsalisichkova@gmail.com"
    And I enter password "1234"
    And I click Login button
    Then logged user email should be "ralitsalisichkova@gmail.com"


  Scenario: Can login successfully
    When I enter username "ralitsalisichkova@gmail.com" and password "1234" and click Login button
    Then logged user email should be "ralitsalisichkova@gmail.com"


