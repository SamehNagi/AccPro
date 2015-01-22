
Given /the following accounts exist:/ do |accounts_table|
  accounts_table.hashes.each do |account|
    Account.create!(account)
  end
end
