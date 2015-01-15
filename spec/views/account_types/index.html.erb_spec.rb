require 'rails_helper'

RSpec.describe "account_types/index", :type => :view do
  before(:each) do
    assign(:account_types, [
      AccountType.create!(
        :account_type => "Account Type"
      ),
      AccountType.create!(
        :account_type => "Account Type"
      )
    ])
  end

  it "renders a list of account_types" do
    render
    assert_select "tr>td", :text => "Account Type".to_s, :count => 2
  end
end
