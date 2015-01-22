class AccountsController < ApplicationController
  before_filter :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index 
    @accounts = Account.all
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
    @account = Account.new
  end

  def edit
    #debugger
    @account = Account.find(params[:id])
  end

  def create
    #debugger
    @account = Account.create!(params[:account])
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
      @account = Account.find(params[:id])
    end
end
