Given /the following transactions exist:/ do |transactions_table|
  transactions_table.hashes.each do |transaction|
    Transaction.create!(transaction)
  end
end
 
Given /^I login successfully/ do
  step "I login with valid credentials"
end

Given(/^I add (\d+) to the total_amount for "(.*)"$/) do |amount,acc_name|
  #pending # express the regexp above with the code you wish you had
  #x=find(text: "account[account_name]").value
  x=find_field('account[total_amount]').value #.should eq '0'
  y=x+amount
  fill_in('account[total_amount]', :with => y)
end


Given (/^I am on the "(.*)" edit page/) do |acc_name|
  visit path_to(acc_name<<" edit page")
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end

end

When /^(?:|I )click "Create Transaction"$/ do
  
  click_button("Create Transaction")
end

Then(/^I should see the total_amount of "(.*?)" should be "(.*?)"$/) do |acc_name, amount|
  find('tr', text: acc_name).should have_content(amount)

end


