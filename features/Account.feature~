Feature: Create new account
  In order to have a list of transactions
  As an accountant
  I want to add new accounts 

Background: User is logged in as accountant1

And the following accounts exist:
  | name    | account_type_id   | 
  | Capital | Equity            | 
  | Bank    | Asset             |
  
And the following transactions exist:
  | from_account     |to_account     | amount     | description     | 
  | Capital	     |Bank           | 50000.0    | Capital_to_Bank | 

  Scenario: Add new account
    When I am on the accounts page
    And I follow "New account"
    Then I should be on the new account page
    When I fill in "account_number" with "Bank"
    And I select "Asset" from "account_type"
    And I press "Create Account"
    Then I should see "Account created successfully!"
  
  Scenario: create new empty account
    When I am on the accounts page
    And I follow "New account"
    Then I should be on the new account page
    When I fill in "account_name" with ""
    And I select "Asset" from "account_type"
    And I press "Create Account"
    Then I should see "account number can't be empty!"

  Scenario: show existing account
    Given I am on the accounts page
    And I click show on the first account on the list
    Then I should see "Capital"
  
  Scenario: edit existing account
    Given I am on the accounts page
    And I click edit on the first account on the list
    Then I should be on the edit account page
