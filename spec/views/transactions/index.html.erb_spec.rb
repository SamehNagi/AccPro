require 'rails_helper'

RSpec.describe "transactions/index", :type => :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :from_account => "From Account",
        :to_account => "To Account",
        :account => nil
      ),
      Transaction.create!(
        :from_account => "From Account",
        :to_account => "To Account",
        :account => nil
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => "From Account".to_s, :count => 2
    assert_select "tr>td", :text => "To Account".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
