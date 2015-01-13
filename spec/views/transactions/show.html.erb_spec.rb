require 'rails_helper'

RSpec.describe "transactions/show", :type => :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :from_account => "From Account",
      :to_account => "To Account",
      :user => "User",
      :account => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/From Account/)
    expect(rendered).to match(/To Account/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(//)
  end
end
