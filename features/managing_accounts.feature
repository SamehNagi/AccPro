Feature: manage an account

  As an accountant
  So that I can a see the list of my accounts
  I want to add new accounts

Background: accounts in database

  Given the following acc exist:
  | account_number| account_name | account_type | total_amount | balance_type |
  | 1             | Cash         | Asset        | 5000         | Credit       |
  | 2             | Bank         | Asset        | 5000         | Credit       |
  | 3             | Equipment    | Asset        | 10000        | Credit       |
  | 4             | Debt         | Liability    | 10000        | Debit        |
  | 5             | Any Expenses | Expense      | 0            | Credit       |
  | 6             | Capital      | Equity       | 10000        | Debit        |
  | 7             | Revenue      | Equity       | 0            | Debit        |
  
Scenario: add new account
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "Account Name" with "Bank"
  And I select "Asset" from "Account Type"
  And I press "Create Account"
  Then I should see "Account created successfully!"

Scenario: create new account with empty account name
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "Account Name" with ""
  And I select "Asset" from "Account Type"
  And I press "Create Account"
  Then I should see "Account name can't be empty!"

Scenario: edit the account name and account type for an existing account
  When I go to the edit page for "Bank"
  And  I fill in "Account name" with "Project Expenses"
  And I select "Expense" from "Account Type"
  And  I press "Update Account Info"
  Then I should see "Account updated successfully!"

Scenario: show existing account
  Given I am on the accounts page
  And I click show on the first account on the list
  Then I should see "Capital"
