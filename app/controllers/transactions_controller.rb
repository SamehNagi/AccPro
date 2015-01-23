class TransactionsController < ApplicationController
  before_filter :set_transaction, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @transactions = Transaction.all
    respond_with(@transactions)
  end

  def show
    respond_with(@transaction)
  end

  def new
    #there should be at least two accounts to perform transactions
    if Account.count < 2
      redirect_to transactions_path
      flash[:notice] = "You haven't enterred any account yet"
    else 
      #getting ID of the transaction
      if Transaction.count ==0
        @trans_id = 1
      else
        @trans_id = Transaction.all.sort.last.id+1
      end
      @transaction = Transaction.new
      respond_with(@transaction)
    end
  end

  def edit
  end

  def create
    debugger
    # Assets-Liab = equity -Expenses 
    #le3b keteer
    #decrease from if it's an asset or expense
    #increase from if it's a liability or equity
    #increase to   if it's an asset or expense
    #decrease to   if it's a liability or equity
    from_account = Account.find_by_id(params[:transaction][:from_account])
    to_account   = Account.find_by_id(params[:transaction][:to_account])
    amount       = params[:transaction][:amount]
    #TODO check whether they are nil or not 
    #TODO check zero issues in total_amount

    if from_account.account_type == "Assets" || from_account.account_type == "Expenses" 
      from_account.total_amount = from_account.total_amount - amount

    elsif from_account.account_type == "Liabilities" || from_account.account_type == "Equity"   
      from_account.total_amount = from_account.total_amount + amount
    end 

    if to_account.account_type == "Assets" || to_account.account_type == "Expenses"  
      to_account.total_amount = to_account.total_amount + amount

    elsif to_account.account_type == "Liabilities" || to_account.account_type == "Equity"  
      from_account.total_amount = from_account.total_amount - amount
    end   
	
    @transaction = Transaction.new(params[:transaction])
    @transaction.save
    respond_with(@transaction)
  end

  def update
    @transaction.update_attributes(params[:transaction])
    respond_with(@transaction)
  end

  def destroy
    @transaction.destroy
    respond_with(@transaction)
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
end
