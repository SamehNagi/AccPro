class Account < ActiveRecord::Base
  has_many :transactions, :dependent => :destroy
 attr_accessible :account_number, :account_name, :account_type, :total_amount, :balance_type
end
