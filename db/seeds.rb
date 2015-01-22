accounts = [{:account_number => '10', :account_name =>'Bank', :account_type => 'Asset', :total_amount => 20000, :balance_type => 'Credit'}, 
            {:account_number => '11', :account_name =>'Dept', :account_type => 'Liability', :total_amount => 0, :balance_type => 'Debit'}, 
            {:account_number => '12', :account_name =>'Capital', :account_type => 'Equity', :total_amount => 20000, :balance_type => 'Debit'}, 
            {:account_number => '13', :account_name =>'Project Expenses', :account_type => 'Expense', :total_amount => 0, :balance_type => 'Credit'}]



accounts.each do |account|
  Account.create!(account)
end
