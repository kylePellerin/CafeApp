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

ActiveRecord::Schema[8.1].define(version: 2026_05_11_134648) do
  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.string "size"
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "customer_name"
    t.string "status"
    t.decimal "total"
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "price_lg"
    t.decimal "price_sm"
    t.decimal "single_price"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
end
