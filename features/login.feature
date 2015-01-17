Feature: Accountant signning in
  In order to sign-in
  as an accountant
  I want to be able to register by email and a password

  Scenario: Correct log in
    Given I have entered nevinemgouda@gmail.com
    And I have entered the correct password
    When I am in the log in page 
    And I press log-in
    Then I should be logged in

  Scenario: Wrong log in
    Given I have entered nevinemgouda@gmail.com
    And I have entered the wrong password
    When I am in the log in page 
    And I press log-in
    Then I should get an error message

  Scenario: empty enteries for log in
    Given I have not entered a username
    And I have not entered a password
    When I am in the log in page 
    And I press log-in
    Then I should get an error message

