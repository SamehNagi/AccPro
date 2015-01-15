class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :balance_type
      t.references :account_type
      t.references :user

      t.timestamps
    end
    add_index :accounts, :account_type_id
    add_index :accounts, :user_id
  end
end
