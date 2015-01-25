class Transaction < ActiveRecord::Base
  has_many :account, :dependent => :destroy
  belongs_to :user attr_accessible :from_account, :to_account, :amount, :description
end
