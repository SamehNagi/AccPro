Given /^I am a valid user$/ do
  @user=User.create!({
             :email => "sameh@hotmail.com",
             :password => "12345678",
             :password_confirmation => "12345678"})
end


When(/^I fill in email with "(.*?)"$/) do |value|
  fill_in(:Email, :with => value)
end

When(/^I fill in password with "(.*?)"$/) do |value|
  fill_in(:Password, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
  page.driver.submit :post, "/users/sign_in", {}
end
