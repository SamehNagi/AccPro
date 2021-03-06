class Account < ActiveRecord::Base
  has_many :transactions, :dependent => :destroy
  belongs_to :user
  validates :user_id, presence: true
  #validates :account_name, uniqueness: true 
  attr_accessible :account_number, :account_name, :account_type, :total_amount, :balance_type, :user_id
  

  #determining the logic of the from to transaction
  # Assets-Liab = equity -Expenses 
  #decrease from if it's an asset or expense
  #increase from if it's a liability or equity
  #increase to   if it's an asset or expense
  #decrease to   if it's a liability or equity
  def self.from_to(from_account, to_account)
    fromto = Hash.new
    if from_account.account_type == 'Asset' || from_account.account_type == 'Expense' 
      fromto["from"] = 'sub'
    elsif from_account.account_type == 'Liability' || from_account.account_type == 'Equity'   
      fromto["from"] = 'add'   
    end 
    if to_account.account_type == 'Asset' || to_account.account_type == 'Expense'  
      fromto["to"] = 'add'
    elsif to_account.account_type == 'Liability' || to_account.account_type == 'Equity'  
      fromto["to"] = 'sub'
    end 
    return fromto
  end

  def self.duplicate?(name, user)
    found = false 
    user_accounts = user.accounts.all
    user_accounts.each do |account|
      if account.account_name == name
        found = true
      end
    end
    found
  end

  def self.acc_new(account_type)
    #debugger
    if (account_type == 'Asset' || account_type == 'Expense')
      balance_type = 'Debit'
    elsif (account_type == 'Equity' || account_type == 'Liability')
      balance_type = 'Credit'
    end
    balance_type
  end
  #used by transactions and balancing option for the DRY concept
  #in regular balancing pass 0's as parameters (0,0,0)
  def self.balance(from_account, to_account, amount)
    debit  = 0
    credit = 0
    #validating transaction 
    if (from_account !=0 && to_account !=0 && amount != 0)
      fromto = from_to(from_account, to_account) 
      if fromto["from"] == 'sub' 
        debit  -= amount
      elsif fromto["from"] == 'add'   
        credit += amount   
      end 
      if fromto["to"] == 'add' 
        debit  += amount
      elsif fromto["to"] == 'sub'
        credit -= amount
      end 
    end
    account = Account.all
    account.each do |acc|
      if acc.balance_type    == 'Debit'
        debit  += acc.total_amount
      elsif acc.balance_type == 'Credit'
        credit += acc.total_amount
      end
      end
      balance = debit - credit
      return balance 
    end 
  #TODO check whether they are nil or not 
  #TODO check zero issues in total_amount
  #returns account ID for validation error, returns 0 for passing transactions
  def self.transaction_account(from_account, to_account, amount)
    from_initial = from_account.total_amount 
    to_initial   = to_account.total_amount
    fromto = Account.from_to(from_account, to_account)
    @message = ""
    if fromto["from"] == 'sub' 
      if (from_initial - amount) < 0
        return "from account: #{from_account.account_name}"
      else
      	from_account.update_attribute(:total_amount, (from_initial-amount))
      end
    elsif fromto["from"] == 'add'   
      from_account.update_attribute(:total_amount, (from_initial+amount))   
    end 
    if fromto["to"] == 'add' 
      to_account.update_attribute(:total_amount, (to_initial+amount))
    elsif fromto["to"] == 'sub'
      if (to_initial - amount) < 0
        return "to account: #{to_account.account_name}"
      else
        to_account.update_attribute(:total_amount, (to_initial-amount)) 
      end
    end 
    return ''
  end
end
