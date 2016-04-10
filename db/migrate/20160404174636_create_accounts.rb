class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number, default: "#{Faker::Number.number(10)}"
      t.integer :balance, default: 0
      t.integer :trans
      t.integer :transaction_amount
      t.integer :user_id
      t.datetime :record_dates, array: true, default: [DateTime.now]
      t.string :records, array: true, default: ["New Account"]
      t.integer :amounts, array: true, default: [0]
      t.timestamps null: false
    end
  end
end
