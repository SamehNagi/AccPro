class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :account_name
      t.string :account_type
      t.integer :total_amount
      t.string :balance_type


      t.timestamps
    end
  end
end
