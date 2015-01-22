Feature: Sign Up and Sign In for users

  In order to user AccPro
  As a user 
  I want to be able to Sign Up or Sign In

  Scenario: Successfully Sign In
    When I am on Log-in page
    And I fill in email with "nevinemgouda@gmail.com"
    And I fill in password with "12345678"
    And I follow "Log in"
    Then I should see "Signed in successfully."
    
 
