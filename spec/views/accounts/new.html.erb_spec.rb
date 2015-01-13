require 'rails_helper'

RSpec.describe "accounts/new", :type => :view do
  before(:each) do
    assign(:account, Account.new(
      :account_no => "MyString",
      :balance_type => "MyString"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_account_no[name=?]", "account[account_no]"

      assert_select "input#account_balance_type[name=?]", "account[balance_type]"
    end
  end
end
