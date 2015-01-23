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
