require 'rails_helper'

RSpec.describe "accounts/show", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :account_number => "Account Number",
      :account_type => "Account Type",
      :balance_type => "Balance Type",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Account Number/)
    expect(rendered).to match(/Account Type/)
    expect(rendered).to match(/Balance Type/)
    expect(rendered).to match(//)
  end
end
