Feature: Managing new transactions

  In order to handle my accounts together
  As an accountant
  I want to create a new transaction between accounts

Background: accounts and transactions in database
                                          
  Given I sign in with valid credentials
  And the following accounts exist:
   | account_number| account_name | account_type | total_amount | balance_type | user_id |
   | 1             | Cash         | Asset        | 10           | Debit        | 1       |
   | 2             | Bank         | Asset        | 0            | Debit        | 1       |
   | 3             | Equipment    | Asset        | 5            | Debit        | 1       |
   | 4             | loan         | Liability    | 10           | Credit       | 1       |
   | 5             | Any Expenses | Expense      | 5            | Debit        | 1       |
   | 6             | Capital      | Equity       | 10           | Credit       | 1       |
   | 7             | Revenue      | Equity       | 0            | Credit       | 1       |   
  
  And the following transactions exist:
  | from_account     | to_account    | amount |
  | loan             | Cash          | 10     |

Scenario: Go to creating a new transaction and dynamically allocating ID 
  Given I am on the transactions page
  When  I follow New Transaction
  Then  I should be on the new transaction page 
  AND   I should see 2

Scenario: Go back to accounts
  Given I am on the transactions page
  When I follow Back to accounts
  Then I should be on the accounts page 
  
Scenario: Successfully creating a new transaction from a Liability to an Asset 
  Given I am on the new transaction page
  When  I select loan from from account
  And   I select Bank from to account
  And   I fill in Amount with 10
  And   I press Create Transaction
  Then  I should be on the transaction page with id 2
  And   I should see loan
  AND   I should see Bank
  AND   I should see 10  
  AND  I follow "Back to accounts" 
  Then  I should see "Current balance = 0"
  AND the total_amount of Bank should be 10 
  AND the total_amount of loan should be 20 

Scenario: Successfully creating a new transaction from an Asset to Liability 
  Given I am on the new transaction page
  When  I select Cash from from account
  And   I select loan from to account
  And   I fill in Amount with 10
  And   I press Create Transaction
  Then  I should be on the transaction page with id 2
  And   I should see Cash
  AND   I should see loan
  AND   I should see 10  
  AND   I follow "Back to accounts" 
  Then  I should see "Current balance = 0"
  AND the total_amount of Cash should be 0
  AND the total_amount of loan should be 0   

Scenario: Successfully creating a new transaction from an Equity to Asset 
  Given I am on the new transaction page
  When  I select Capital from from account
  And   I select Bank from to account
  And   I fill in Amount with 10
  And   I press Create Transaction
  Then  I should be on the transaction page with id 2
  And   I should see Capital
  AND   I should see Bank
  AND   I should see 10  
  AND   I follow "Back to accounts" 
  Then  I should see "Current balance = 0"
  AND the total_amount of Capital should be 0
  AND the total_amount of Bank should be 10   

  
Scenario: Successfully creating a new transaction from an Asset to Equity 
  Given I am on the new transaction page
  When  I select Cash from from account
  And   I select Capital from to account
  And   I fill in Amount with 10
  And   I press Create Transaction
  Then  I should be on the transaction page with id 2
  And   I should see Cash
  AND   I should see Capital
  AND   I should see 10  
  AND   I follow "Back to accounts" 
  Then  I should see "Current balance = 0"
  AND the total_amount of Cash should be 0
  AND the total_amount of Capital should be 20  

Scenario: Successfully creating a new transaction from an Liability to Equity 
  Given I am on the new transaction page
  When  I select loan from from account
  And   I select Capital from to account
  And   I fill in Amount with 10
  And   I press Create Transaction
  Then  I should be on the transaction page with id 2
  And   I should see loan
  AND   I should see Capital
  AND   I should see 10  
  AND   I follow "Back to accounts" 
  Then  I should see "Current balance = 0"
  AND the total_amount of loan should be 20
  AND the total_amount of Capital should be 0 

Scenario: Successfully creating a new transaction from an Equity to Liability 
  Given I am on the new transaction page
  When  I select Capital from from account
  And   I select loan from to account
  And   I fill in Amount with 10
  And   I press Create Transaction
  Then  I should be on the transaction page with id 2
  And   I should see Capital
  AND   I should see loan
  AND   I should see 10  
  AND   I follow "Back to accounts" 
  Then  I should see "Current balance = 0"
  AND the total_amount of Capital should be 20
  AND the total_amount of loan should be 0 
  
  
Scenario: Successfully creating a new transaction from an Asset to Expense 
  Given I am on the new transaction page
  When  I select Cash from from account
  And   I select "Any Expenses" from to account
  And   I fill in Amount with 5
  And   I press Create Transaction
  Then  I should be on the transaction page with id 2
  And   I should see Cash
  AND   I should see Capital
  AND   I should see 5  
  AND   I follow "Back to accounts" 
  Then  I should see "Current balance = 0"
  AND the total_amount of Cash should be 5
  AND the total_amount of Any Expenses should be 10 
    
  
Scenario: unbalanced accounts should not allow a new transaction
  Given I am on the accounts page
  And   I add 100 to the total_amount of bank 
  then  I should see "Current balance = 100"
  When  I follow "Transaction" 
  And   I follow "New Transaction"
  And   I select "loan" from "from account"
  And   I select "Bank" from "to account"
  And   I fill in "Amount" with "10"
  Then  I should be on the new transaction page 
  And   I should see "Your accounts are unbalanced, please double check your entries"
  And the total_amount of Bank should be 0
  And the total_amount of loan should be 10
  
Scenario: Overdraft is not allowed 
  Given I am on the new transaction page
  When  I select Bank from "from account"
  And   I select loan from "to account"
  And   I fill in "Amount" with "10"
  And   I press "Create Transaction"
  Then  I should be on the new transaction page 
  And   I should see "Bank is initially zero so that would result in an overdraft, please check your transaction again"
  And the total_amount of Bank should be 0
  And the total_amount of loan should be 10

Scenario: Negative amount is not allowed 
  Given I am on the new transaction page
  When  I select "Bank" from "from account"
  And   I select "loan" from "to account"
  And   I fill in "Amount" with "-1"
  And   I press "Create Transaction"
  Then  I should be on the new transaction page 
  And   I should see "Amount has a negative sign and that's not allowed, please re-enter the amount"
  
