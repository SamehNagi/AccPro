When(/^I fill in email with "(.*?)"$/) do |value|
  fill_in(:Email, :with => value)
end

When(/^I fill in password with "(.*?)"$/) do |value|
  fill_in(:Password, :with => value)
end
