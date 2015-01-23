class Account < ActiveRecord::Base
  has_many :transactions, :dependent => :destroy
  belongs_to :user
  validates :user_id, presence: true 
  attr_accessible :account_number, :account_name, :account_type, :total_amount, :balance_type, :user_id
  
  def self.acc_new(params)
    account_name = params[:name]["Account Name"]
    account_type = params[:account]["account_type"]
    if (account_type == 'Asset' || account_type == 'Expense')
      balance_type = 'Debit'
    elsif (account_type == 'Equity' || account_type == 'Liability')
      balance_type = 'Credit'
    end
    total_amount = 0 
    create!({:account_name => account_name, :account_type => account_type, :total_amount => total_amount, :balance_type => balance_type})
  end
end
