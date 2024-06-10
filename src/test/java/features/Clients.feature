@test
Feature: Clients tests http://inv.bg/clients/manage

  Background:
    Given user is logged in the system
    Then logged user email should be "ralitsalisichkova@gmail.com"
    When I delete all clients


  Scenario: Can navigate to clients page
    When I navigate to Clients page
    Then Add New Client button should contain text "Нов клиент"

  Scenario Outline: Can add new client with valid data
    When I navigate to Clients page
    Then Add New Client button should contain text "Нов клиент"
    When I create new client with name "<name>" and vat "<vat>" and address "<address>" and town "<town>"
    Then client message with text should be displayed "Клиентът е добавен успешно."
    Examples:
      | name          | vat      | address  | town    |
      | АЛ-ИМПОРТ ООД | 43543646 | Ruski 20 | Plovdiv |
      | Pragmatic LTD | 123      | 20 Руски | Пловдив |
      | Грабо ООД     | 54654    | ruski 20 | СОФИЯ   |

