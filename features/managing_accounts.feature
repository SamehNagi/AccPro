Feature: manage an account

  As an accountant
  So that I can a see the list of my accounts
  I want to add new accounts

Background: accounts in database

  Given I am a valid user
  
  And the following accounts exist:
  | account_number| account_name | account_type | total_amount | balance_type | user_id |
  | 1             | Cash         | Asset        | 0            | Debit        | 1       |
  | 2             | Bank         | Asset        | 0            | Debit        | 1       |
  | 3             | Equipment    | Asset        | 0            | Debit        | 1       |
  | 4             | Debt         | Liability    | 0            | Credit       | 1       |
  | 5             | Any Expenses | Expense      | 0            | Debit        | 1       |
  | 6             | Capital      | Equity       | 0            | Credit       | 1       |
  | 7             | Revenue      | Equity       | 0            | Credit       | 1       |      
  When I am on Log-in page
  And I fill in email with "sameh@hotmail.com"
  And I fill in password with "12345678"
  And I press "Log in"
  Then I should be on the home page

Scenario: add new account
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "name_Account Name" with "Computers"
  And I select "Asset" from "Account Type"
  And I click "Create Account"
  Then I should see "was successfully created."

Scenario: create new account with empty account name
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "name_Account Name" with ""
  And I select "Asset" from "Account Type"
  And I click "Create Account"
  Then I should see "Name can not be empty"

Scenario: edit the account name and account type for an existing account
  When I go to the edit page for "Bank"
  And  I fill in "Account Name" with "Project Expenses"
  And I select "Expense" from "Account Type"
  And  I click "Update Account Info."
  Then I should see "Account has been updated successfully"

Scenario: show existing account
  Given I am on the accounts page
  And I follow Edit on the first account on the list
  Then I should see "1"
