class Account < ActiveRecord::Base
  attr_accessible :account_no, :account_type, :balance_type
end
