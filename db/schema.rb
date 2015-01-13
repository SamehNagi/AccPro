ActiveRecord::Schema.define(:version => 20150113220340) do

  create_table "account_types", :force => true do |t|
    t.string   "type"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "account_types", ["account_id"], :name => "index_account_types_on_account_id"

  create_table "accounts", :force => true do |t|
    t.string   "account_no"
    t.string   "balance_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "transactions", :force => true do |t|
    t.string   "from_account"
    t.string   "to_account"
    t.string   "user"
    t.integer  "account_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "transactions", ["account_id"], :name => "index_transactions_on_account_id"

end
