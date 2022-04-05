class CreateStationTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :station_transactions do |t|
      t.integer :from_to, default: 0

      t.timestamps

      t.references :station, foreign_key: true, null: false
      t.references :transaction, foreign_key: true, null: false
    end
  end
end
