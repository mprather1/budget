class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.integer :balance
      t.integer :trans
      t.integer :user_id
      t.datetime :records, array: true, default: [DateTime.now]
      t.timestamps null: false
    end
  end
end
