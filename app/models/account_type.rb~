class AccountType < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  has_many :transactions, :dependent => :destroy
  attr_accessible :account_type
end
