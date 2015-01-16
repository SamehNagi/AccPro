class Account < ActiveRecord::Base
  belongs_to :account_type
  belongs_to :user
  has_many :transactions, :dependent => :destroy
  validates :account_number, presence: true, uniqueness: true
  attr_accessible :account_number, :balance_type, :total_amount, :account_type_id
end
