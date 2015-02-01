Given /the following accounts exist:/ do |accounts_table|
  accounts_table.hashes.each do |account|
    Account.create!(account)
  end
end

#When /I fill in "Account Name" with "(.*?)"$/ do |value|
#  fill_in(:name_Account_Name, :with => value)
#end

Given /User is logged in as (.*)/ do |arg_email|
  visit path_to('the home page')
  user=User.find_by_email(arg_email)
  fill_in(:Email, :with => arg_email)
  fill_in(:Password, :with => '12345678')
  click_button('Log in')
  page.driver.submit :post, "/users/sign_in", {}
end



Given /I follow Edit on the first account on the list/ do
  page.driver.submit :get, "/accounts/#{Account.first.id}", {}
end

When /^(?:|I )click "Create Account"$/ do
  
  click_button("Create Account")
  
  #page.driver.submit :get, "/accounts", {}
end


When /^(?:|I )click "Update Account Info."$/ do
  click_button("Update Account Info.")
end

def ret_balance_type(acc_type)
  @record=Account.find_by_account_type(acc_type)
  return :balance_type
end
Then(/^the balance type for "(.*?)" should be "(.*?)"$/) do |acc_type, bal_type|
  first('tr', text: acc_type).should have_content(bal_type)
end

