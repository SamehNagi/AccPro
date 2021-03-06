# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^Log-in page$/
      new_user_session_path

    when /^Sign-Up page$/
      new_user_registration_path

    when /^New Account$/
      new_account_path
   
    when /the New Account page$/
      new_account_path

    when /^accounts page$/
      accounts_path

    when /^the edit page for "(.*)"$/
      account=Account.find_by_account_name($1)
      edit_account_path(account)
  
    when /^the transactions page$/
      transactions_path

    when /^the new transaction page$/
      new_transaction_path

    when /^the transaction page with id "(.*)"$/
      transaction_path($1)
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
