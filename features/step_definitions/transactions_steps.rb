Given /the following transactions exist:/ do |transactions_table|
  transactions_table.hashes.each do |transaction|
    Transaction.create!(transaction)
  end
end
