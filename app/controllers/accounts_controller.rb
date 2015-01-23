class AccountsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index 
    @accounts = current_user.accounts.all
    @accounts.each do |account|
      if (account.total_amount).nil?
        account.total_amount = 0
      else
      end
      if (account.balance_type).nil?
        account.balance_type = "N/A"
      else
      end
    end
  end

  def show
  end

  def new
    #generating created account ID
    if(Account.count > 0)
      @acc_id  = Account.all.sort.last.id+1
    else 
      @acc_id  = 1
    end 
    @account = current_user.accounts.new
  end

  def edit
    #debugger
    @account = current_user.accounts.find(params[:id])
  end

  def create
    #debugger
    @account = current_user.accounts.acc_new(params)
    redirect_to accounts_path
    flash[:notice] = "#{@account.account_name} was successfully created."
  end

  def update
    #debugger
    @account.update_attributes(params[:account])
    redirect_to accounts_path
  end

  def destroy
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = current_user.accounts.find(params[:id])
    end
end
