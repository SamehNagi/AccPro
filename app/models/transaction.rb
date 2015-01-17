class Transaction < ActiveRecord::Base
  belongs_to :account
  validates :from_account ,presence: true
  validates :to_account ,presence: true
  validates :amount ,presence: true
  attr_accessible :from_account, :to_account, :amount, :description
end
