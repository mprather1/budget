class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number, default: "#{Faker::Number.number(10)}"
      t.integer :balance, default: Faker::Number.between(1000, 100000)
      t.integer :trans
      t.integer :user_id
      t.datetime :record_dates, array: true, default: [DateTime.now]
      t.string :records, array: true, default: ["New Account"]
      t.timestamps null: false
    end
  end
end
