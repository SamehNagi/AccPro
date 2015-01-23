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
    @all_accounts = current_user.accounts.all 
    #there should be at least two accounts to perform transactions
    if current_user.accounts.count < 2
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
    from_account = current_user.accounts.find_by_id(params[:transaction][:from_account].to_i)
    to_account   = current_user.accounts.find_by_id(params[:transaction][:to_account].to_i)
    amount       = params[:transaction][:amount].to_i
    balance      = current_user.accounts.balance(from_account, to_account, amount);
    if (balance == 0) 
      current_user.accounts.transaction_account(from_account, to_account, amount)
      @transaction = Transaction.new(params[:transaction])
      @transaction.save
      respond_with(@transaction)
    else
      redirect_to new_transaction
      flash[:notice] = "Your accounts are unbalanced, please double check your entries"
    end
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
