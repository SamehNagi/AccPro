class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_no
      t.string :balance_type

      t.timestamps
    end
  end
end
