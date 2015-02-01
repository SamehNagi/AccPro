FactoryGirl.define do
  factory :account do
    account_number 10
    account_name "MyString"
    account_type "Type"
    total_amount 1
    balance_type "BalanceType"
  end
end
