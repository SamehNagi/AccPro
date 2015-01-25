accounts = [
{:account_number => 1, :account_name => "Cash", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 1}, 
{:account_number => 2, :account_name => "Bank", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 1}, 
{:account_number => 3, :account_name => "Equipment", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 1}, 
{:account_number => 4, :account_name => "loan", :account_type => "Liability", :total_amount => 0, :balance_type => "Credit", :user_id => 1}, 
{:account_number => 5, :account_name => "Any Expenses", :account_type => "Expense", :total_amount => 0, :balance_type => "Debit", :user_id => 1}, 
{:account_number => 6, :account_name => "Capital", :account_type => "Equity", :total_amount => 0, :balance_type => "Credit", :user_id => 1}, 
{:account_number => 7, :account_name => "Revenue", :account_type => "Equity", :total_amount => 0, :balance_type => "Credit", :user_id => 1},
{:account_number => 8, :account_name => "Office Assets", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 2},
{:account_number => 9, :account_name => "Cash", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 2}, 
{:account_number => 10, :account_name => "Bank Deposit", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 2}, 
{:account_number => 11, :account_name => "Equipment", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 2}, 
{:account_number => 12, :account_name => "Car", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 2}, 
{:account_number => 13, :account_name => "Mshareeb", :account_type => "Expense", :total_amount => 0, :balance_type => "Debit", :user_id => 2}, 
{:account_number => 14, :account_name => "Deyoon", :account_type => "Liability", :total_amount => 0, :balance_type => "Credit", :user_id => 2}, 
{:account_number => 15, :account_name => "Receivable accounts", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 2}, 
{:account_number => 16, :account_name => "Payable accounts", :account_type => "Liability", :total_amount => 0, :balance_type => "Credit", :user_id => 2}, 
{:account_number => 17, :account_name => "Salaries", :account_type => "Expense", :total_amount => 0, :balance_type => "Debit", :user_id => 2}, 
{:account_number => 18, :account_name => "New partner's share", :account_type => "Equity", :total_amount => 0, :balance_type => "Credit", :user_id => 2}
]

accounts.each do |account|
  Account.create!(account)
end
