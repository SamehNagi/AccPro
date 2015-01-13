class AccountType < ActiveRecord::Base
  belongs_to :account
  attr_accessible :type
end
