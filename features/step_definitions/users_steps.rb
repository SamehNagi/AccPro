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

When(/^I fill in password confirmation with "(.*?)"$/) do |value|
  fill_in(:user_password_confirmation, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
  if button =='Sign up'
    page.driver.submit :get, "/users/sign_up", {}
  else
    page.driver.submit :post, "/users/sign_in", {}
  end
end