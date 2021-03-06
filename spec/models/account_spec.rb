require 'rails_helper'
  RSpec.describe Account, :type => :model do
    describe 'validate transaction' do
#*************************************************************************#
############################# from_to method ##############################
      it 'valid add from Asset to Equity' do
        account1 = FactoryGirl.create(:account, :account_number => 1, :account_name => "First", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 1)
        account2 = FactoryGirl.create(:account, :account_number => 2, :account_name => "Second", :account_type => "Equity", :total_amount => 0, :balance_type => "Credit", :user_id => 1)

        Account.from_to(account1, account2).should eq("from" => 'sub', "to" => 'sub')
      end

      it 'valid add from Expense to Expense' do
        account1 = FactoryGirl.create(:account, :account_number => 1, :account_name => "First", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 1)
        account2 = FactoryGirl.create(:account, :account_number => 2, :account_name => "Second", :account_type => "Expense", :total_amount => 0, :balance_type => "Debit", :user_id => 1)

        Account.from_to(account1, account2).should eq("from" => 'sub', "to" => 'add')
      end

      it 'valid add from Liability to Asset' do
        account1 = FactoryGirl.create(:account, :account_number => 1, :account_name => "First", :account_type => "Liability", :total_amount => 0, :balance_type => "Credit", :user_id => 1)
        account2 = FactoryGirl.create(:account, :account_number => 2, :account_name => "Second", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 1)

        Account.from_to(account1, account2).should eq("from" => 'add', "to" => 'add')
      end
      
      it 'valid add from Equity to Equity' do
        account1 = FactoryGirl.create(:account, :account_number => 1, :account_name => "First", :account_type => "Equity", :total_amount => 0, :balance_type => "Credit", :user_id => 1)
        account2 = FactoryGirl.create(:account, :account_number => 2, :account_name => "Second", :account_type => "Equity", :total_amount => 0, :balance_type => "Credit", :user_id => 1)

        Account.from_to(account1, account2).should eq("from" => 'add', "to" => 'sub')
      end
    end
#*************************************************************************#
############################# acc_new method ##############################
    describe 'validate the balance_type' do
      
      it 'validate balance_type => Debit' do
        account1 = FactoryGirl.create(:account, :account_number => 1, :account_name => "First", :account_type => "Asset", :total_amount => 0, :balance_type => "Debit", :user_id => 1)
   
        Account.acc_new(account1.account_type).should eq("Debit")
      end
   
      it 'validate balance_type => Debit' do
        account2 = FactoryGirl.create(:account, :account_number => 1, :account_name => "First", :account_type => "Liability", :total_amount => 0, :balance_type => "Credit", :user_id => 1)
   
        Account.acc_new(account2.account_type).should eq("Credit")
      end
    end
  end
