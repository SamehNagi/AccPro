require 'rails_helper'

RSpec.describe "accounts/edit", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :account_number => "MyString",
      :balance_type => "MyString",
      :account_type => nil,
      :user => nil
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_account_number[name=?]", "account[account_number]"

      assert_select "input#account_balance_type[name=?]", "account[balance_type]"

      assert_select "input#account_account_type[name=?]", "account[account_type]"

      assert_select "input#account_user[name=?]", "account[user]"
    end
  end
end
