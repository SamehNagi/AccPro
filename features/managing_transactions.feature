Feature: Managing new transactions

  In order to handle my accounts together
  As an accountant
  I want to create a new transaction between accounts

Background: Given User is logged in as nevinemgouda@gmail.com
  And the following accounts exist:
  | account_number| account_name     | account_type | total_amount | balance_type | user_id | 
  | 1             | Cash             | Asset        |              | Debit        | 1       |
  | 2             | loan             | Asset        |              | Debit        | 1       |
  | 4             | loan             | Liability    | 10           | Credit       | 1       |
  | 21            | Payable accounts | Liability    | 100          | Credit       | 1       |
  And the following transactions exist:
  | from_account     | to_account | amount |
  | loan             | Bank       | 10     |
  | Payable accounts | Cash       | 100    |

Scenario: Go to creating a new transaction
  Given I am on the transactions page
  When I follow "New Transaction"
  Then I should be on the new transaction page 

Scenario: Go back to accounts
  Given I am on the transactions page
  When I follow "Back to accounts"
  Then I should be on the accounts page 
  
Scenario: Successfully creating a new transaction  
  Given I am on the new transaction page
  When I select "loan" from "from account"
  And I select "Bank" from "to account"
  And fill in "Amount" with "10"
  Then I should be on the transaction show page

