require 'rails_helper'

RSpec.describe "accounts/edit", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :account_no => "MyString",
      :account_type => "MyString",
      :balance_type => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_account_no[name=?]", "account[account_no]"

      assert_select "input#account_account_type[name=?]", "account[account_type]"

      assert_select "input#account_balance_type[name=?]", "account[balance_type]"
    end
  end
end
