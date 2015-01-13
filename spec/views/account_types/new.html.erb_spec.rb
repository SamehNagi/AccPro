require 'rails_helper'

RSpec.describe "account_types/new", :type => :view do
  before(:each) do
    assign(:account_type, AccountType.new(
      :type => "",
      :account => nil
    ))
  end

  it "renders new account_type form" do
    render

    assert_select "form[action=?][method=?]", account_types_path, "post" do

      assert_select "input#account_type_type[name=?]", "account_type[type]"

      assert_select "input#account_type_account[name=?]", "account_type[account]"
    end
  end
end
