require 'rails_helper'

RSpec.describe "account_types/index", :type => :view do
  before(:each) do
    assign(:account_types, [
      AccountType.create!(
        :type => "Type",
        :account => nil
      ),
      AccountType.create!(
        :type => "Type",
        :account => nil
      )
    ])
  end

  it "renders a list of account_types" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
