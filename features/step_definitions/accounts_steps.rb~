Given /the following accounts exist:/ do |accounts_table|
  accounts_table.hashes.each do |account|
    Account.create!(account)
  end
end


#When /I fill in "Account Name" with "(.*?)"$/ do |value|
#  fill_in(:name_Account_Name, :with => value)
#end

Given /I follow Edit on the first account on the list/ do
  page.driver.submit :get, "/accounts/#{Account.first.id}", {}
end


