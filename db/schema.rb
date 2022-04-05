# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_04_194510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.decimal "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "station_transactions", force: :cascade do |t|
    t.integer "from_to", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "station_id", null: false
    t.bigint "transaction_id", null: false
    t.index ["station_id"], name: "index_station_transactions_on_station_id"
    t.index ["transaction_id"], name: "index_station_transactions_on_transaction_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "zone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "medium", default: 0
    t.decimal "actual_amount", default: "0.0"
    t.decimal "deducted_amount", default: "0.0"
    t.decimal "deposit_amount", default: "0.0"
    t.integer "status", default: 0
    t.integer "transaction_type", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "card_id", null: false
    t.index ["card_id"], name: "index_transactions_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "users"
  add_foreign_key "station_transactions", "stations"
  add_foreign_key "station_transactions", "transactions"
  add_foreign_key "transactions", "cards"
end
