require 'rails_helper'

RSpec.describe "accounts/index", :type => :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :account_no => "Account No",
        :balance_type => "Balance Type"
      ),
      Account.create!(
        :account_no => "Account No",
        :balance_type => "Balance Type"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Account No".to_s, :count => 2
    assert_select "tr>td", :text => "Balance Type".to_s, :count => 2
  end
end
