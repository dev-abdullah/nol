class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.decimal :balance

      t.timestamps

      t.references :user, foreign_key: true, null: false
    end
  end
end
