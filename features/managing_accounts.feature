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

Scenario: see the next ID
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  Then I should see "8"

Scenario: Assets' balance type is created by default as Debit
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "name_Account Name" with "Computers"
  And I select "Asset" from "Account Type"
  And I press "Create Account"
  Then the balance type for "Computers" should be "Debit"

Scenario: liabilities' balance type is created by default as Credit
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "name_Account Name" with "deyoon"
  And I select "Liability" from "Account Type"
  And I press "Create Account"
  Then the balance type for "deyoon" should be "Credit"

Scenario: Equity's balance type is created by default as Credit
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "name_Account Name" with "Capital"
  And I select "Equity" from "Account Type"
  And I press "Create Account"
  Then the balance type for "Capital" should be "Credit"  

Scenario: Expense's balance type is created by default as Credit
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "name_Account Name" with "Expense"
  And I select "Expense" from "Account Type"
  And I press "Create Account"
  Then the balance type for "Expense" should be "Debit"  

Scenario: Avoiding duplicates validation
  When I am on the accounts page
  And I follow "New Account"
  Then I should be on the New Account page
  When I fill in "name_Account Name" with "Cash"
  And I select "Expense" from "Account Type"
  And I press "Create Account"
  Then I should be on the accounts page
  And I should see "Cash is already a valid account please check it below"

Scenario: Navigation to transaction's page 
  When I am on the accounts page
  And I follow "Transactions"
  Then I should be on the transactions page

 
