require 'rails_helper'

RSpec.describe "transactions/new", :type => :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :from_account => "MyString",
      :to_account => "MyString",
      :account => nil
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_from_account[name=?]", "transaction[from_account]"

      assert_select "input#transaction_to_account[name=?]", "transaction[to_account]"

      assert_select "input#transaction_account[name=?]", "transaction[account]"
    end
  end
end
