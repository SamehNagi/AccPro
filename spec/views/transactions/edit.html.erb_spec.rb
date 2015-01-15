require 'rails_helper'

RSpec.describe "transactions/edit", :type => :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :from_account => "MyString",
      :to_account => "MyString",
      :account => nil
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_from_account[name=?]", "transaction[from_account]"

      assert_select "input#transaction_to_account[name=?]", "transaction[to_account]"

      assert_select "input#transaction_account[name=?]", "transaction[account]"
    end
  end
end
