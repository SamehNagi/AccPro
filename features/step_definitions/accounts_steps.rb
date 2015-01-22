Given /User is logged in as (.*)/ do |email|
  User.find_by_email(email)

end
Given /the following accounts exist:/ do |accounts_table|
  accounts_table.hashes.each do |account|
    Account.create!(account)
  end
end

When /I fill in "Account Name" with "(.*?)"$/ do |value|
  fill_in(:account_name, :with => value)
end

