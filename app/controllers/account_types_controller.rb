class AccountTypesController < ApplicationController
  before_filter :set_account_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @account_types = AccountType.all
    respond_with(@account_types)
  end

  def show
    respond_with(@account_type)
  end

  def new
    @account_type = AccountType.new
    respond_with(@account_type)
  end

  def edit
  end

  def create
    @account_type = AccountType.new(params[:account_type])
    @account_type.save
    respond_with(@account_type)
  end

  def update
    @account_type.update_attributes(params[:account_type])
    respond_with(@account_type)
  end

  def destroy
    @account_type.destroy
    respond_with(@account_type)
  end

  private
    def set_account_type
      @account_type = AccountType.find(params[:id])
    end
end
