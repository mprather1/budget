class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :recorded, default: DateTime.now
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
