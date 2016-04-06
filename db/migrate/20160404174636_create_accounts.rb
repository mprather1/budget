class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.integer :balance
      t.integer :trans
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
