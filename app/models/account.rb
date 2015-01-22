class Account < ActiveRecord::Base
  has_many :transactions, :dependent => :destroy
  belongs_to :user
  validates :user_id, presence: true 
  attr_accessible :account_number, :account_name, :account_type, :total_amount, :balance_type, :user_id
end
