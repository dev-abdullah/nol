class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :medium, default: 0
      t.decimal :actual_amount, default: 0
      t.decimal :deducted_amount, default: 0
      t.decimal :deposit_amount, default: 0
      t.integer :status, default: 0
      t.integer :transaction_type, default: 0

      t.timestamps

      t.references :card, foreign_key: true, null: false
    end
  end
end
