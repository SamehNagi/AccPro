Feature: Sign Up and Sign In for users

  In order to user AccPro
  As a user 
  I want to be able to Sign Up or Sign In


  Scenario: Successfully Sign In
    Given I am a valid user
    When I am on Log-in page
    And I fill in email with "sameh@hotmail.com"
    And I fill in password with "12345678"
    And I press "Log in"
    Then I should be on the home page
    
  Scenario: Successfully Sign Up
    When I am on Sign-Up page
    And I fill in email with "nevinemgouda@gmail.com"
    And I fill in password with "12345678"
    And I fill in password confirmation with "12345678"
    And I press "Sign up"
    Then I should be on the home page

  Scenario: Un-Successfully Signning In
    Given I am a valid user
    When I am on Log-in page
    And I fill in email with "nevinemgouda@gmail.com"
    And I fill in password with ""
    And I press "Log in"
    Then I should be on Log-in page


  Scenario: Un-Successfully Signning In
    Given I am a valid user
    When I am on Log-in page
    And I fill in email with ""
    And I fill in password with ""
    And I press "Log in"
    Then I should be on Log-in page
 
  Scenario: Un-Successfully Signning In
    Given I am a valid user
    When I am on Log-in page
    And I fill in email with ""
    And I fill in password with "12345678"
    And I press "Log in"
    Then I should be on Log-in page


  Scenario: Un-Successfully Sign Up
    When I am on Sign-Up page
    And I fill in email with "nevinemgouda@gmail.com"
    And I fill in password with "12345678"
    And I fill in password confirmation with "12345"
    And I press "Sign up"
    Then I should be on Sign-Up page

  Scenario: Un-Successfully Sign Up
    When I am on Sign-Up page
    And I fill in email with "nevinemgouda@gmail.com"
    And I fill in password with "12345678"
    And I fill in password confirmation with "12345"
    And I press "Sign up"
    Then I should be on Sign-Up page
