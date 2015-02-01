FactoryGirl.define do
  factory :transaction do
    from_account "FromAccount"
    to_account "ToAccount"
    amount 1000
    description "Description"
  end
end
