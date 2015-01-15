require 'rails_helper'

RSpec.describe "accounts/new", :type => :view do
  before(:each) do
    assign(:account, Account.new(
      :account_number => "MyString",
      :balance_type => "MyString",
      :account_type => nil,
      :user => nil
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_account_number[name=?]", "account[account_number]"

      assert_select "input#account_balance_type[name=?]", "account[balance_type]"

      assert_select "input#account_account_type[name=?]", "account[account_type]"

      assert_select "input#account_user[name=?]", "account[user]"
    end
  end
end
