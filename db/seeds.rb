account_types = [{:account_type => 'Assets'},
    	  {:account_type => 'Liabilities'},
    	  {:account_type => 'Equity'},
      	  {:account_type => 'Expenses'}]

account_types.each do |type|
  AccountType.create!(type)
end
