class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :from_account
      t.string :to_account
      t.integer :amount
      t.string :description
      #t.references :account



      t.timestamps
    end
    #add_index :transactions, :account_id
  end
end
