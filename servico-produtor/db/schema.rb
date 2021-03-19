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

ActiveRecord::Schema.define(version: 2021_03_19_132717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_attributes", force: :cascade do |t|
    t.string "city"
    t.string "neighborhood"
    t.string "street"
    t.string "uf"
    t.string "zip_code"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "lat"
    t.string "lng"
    t.index ["order_id"], name: "index_address_attributes_on_order_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "request_infos", force: :cascade do |t|
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_request_infos_on_order_id"
  end

  create_table "user_infos", force: :cascade do |t|
    t.string "phone"
    t.string "name"
    t.string "email"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_user_infos_on_order_id"
  end

  add_foreign_key "address_attributes", "orders"
  add_foreign_key "request_infos", "orders"
  add_foreign_key "user_infos", "orders"
end
