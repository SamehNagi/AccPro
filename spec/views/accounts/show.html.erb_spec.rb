require 'rails_helper'

RSpec.describe "accounts/show", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :account_no => "Account No",
      :balance_type => "Balance Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Account No/)
    expect(rendered).to match(/Balance Type/)
  end
end
