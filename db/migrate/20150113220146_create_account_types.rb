class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string :type
      t.references :account

      t.timestamps
    end
    add_index :account_types, :account_id
  end
end
