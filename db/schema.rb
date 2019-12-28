# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191220175427) do

  create_table "inflow_items", force: :cascade do |t|
    t.float    "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
    t.integer  "inflow_id"
    t.index ["inflow_id"], name: "index_inflow_items_on_inflow_id"
    t.index ["product_id"], name: "index_inflow_items_on_product_id"
  end

  create_table "inflows", force: :cascade do |t|
    t.float    "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "cash"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outflow_items", force: :cascade do |t|
    t.float    "quantity"
    t.integer  "outflow_id"
    t.integer  "supply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["outflow_id"], name: "index_outflow_items_on_outflow_id"
    t.index ["supply_id"], name: "index_outflow_items_on_supply_id"
  end

  create_table "outflows", force: :cascade do |t|
    t.float    "total"
    t.boolean  "cash"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "supplier_id"
    t.float    "paid"
    t.index ["supplier_id"], name: "index_outflows_on_supplier_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "unit"
    t.float    "promotion_price"
    t.float    "stock"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.float    "account_balance"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "unit"
    t.float    "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supply_product_links", force: :cascade do |t|
    t.integer "product_id"
    t.integer "supply_id"
    t.index ["product_id"], name: "index_supply_product_links_on_product_id"
    t.index ["supply_id"], name: "index_supply_product_links_on_supply_id"
  end

end
