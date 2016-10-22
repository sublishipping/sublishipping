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

ActiveRecord::Schema.define(version: 20161007160843) do

  create_table "conditions", force: :cascade do |t|
    t.integer  "rate_id"
    t.string   "field",      null: false
    t.string   "verb",       null: false
    t.text     "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "conditions", ["rate_id"], name: "index_conditions_on_rate_id"

  create_table "product_specific_prices", force: :cascade do |t|
    t.integer  "rate_id"
    t.string   "field",      null: false
    t.string   "verb",       null: false
    t.text     "value",      null: false
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_specific_prices", ["rate_id"], name: "index_product_specific_prices_on_rate_id"

  create_table "rates", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "description"
    t.integer  "min_grams"
    t.integer  "max_grams"
    t.integer  "min_price"
    t.integer  "max_price"
    t.float    "price_weight_modifier", default: 0.0, null: false
  end

  add_index "rates", ["shop_id"], name: "index_rates_on_shop_id"

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain",                     null: false
    t.string   "shopify_token",                      null: false
    t.integer  "shipping_carrier_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "currency"
    t.string   "money_format"
    t.string   "locale",              default: "en"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true

end
