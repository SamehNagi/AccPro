accounts = [{:account_number => '10', :account_type => 'Assets', :total_amount => 20000, :balance_type => 'Credit'}, 
            {:account_number => '11', :account_type => 'Liabilities', :total_amount => 0, :balance_type => 'Debit'}, 
            {:account_number => '12', :account_type => 'Equity', :total_amount => 20000, :balance_type => 'Debit'}, 
            {:account_number => '13', :account_type => 'Expenses', :total_amount => 0, :balance_type => 'Credit'}]

accounts.each do |account|
  Account.create!(account)
end
