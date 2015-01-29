Given /the following transactions exist:/ do |transactions_table|
  transactions_table.hashes.each do |transaction|
    Transaction.create!(transaction)
  end
end
 
Given /^I login successfully/ do
  step "I login with valid credentials"
end
