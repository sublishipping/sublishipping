# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160325214241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "filters", force: :cascade do |t|
    t.integer  "rate_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postal_code"
    t.string   "company_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "filters", ["rate_id"], name: "index_filters_on_rate_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rates", ["shop_id"], name: "index_rates_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain",      null: false
    t.string   "shopify_token",       null: false
    t.integer  "shipping_carrier_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree

  add_foreign_key "filters", "rates"
  add_foreign_key "rates", "shops"
end
