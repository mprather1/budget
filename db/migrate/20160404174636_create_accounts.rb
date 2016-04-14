class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number, default: "#{Faker::Number.number(10)}"
      t.float :balance, default: 0
    #  t.float :trans
    #  t.float :transaction_amount
    #  t.string :note
      t.integer :user_id
      t.datetime :record_dates, array: true, default: [DateTime.now]
      t.string :records, array: true, default: ["New Account"]
      t.float :amounts, array: true, default: [0]
      t.string :memos, array: true, default: [nil]
      t.timestamps null: false
    end
  end
end
