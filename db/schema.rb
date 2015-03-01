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

ActiveRecord::Schema.define(version: 20150301223745) do

  create_table "eventers", force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.integer "event_status", limit: 255
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "location"
    t.string   "url"
    t.string   "currency", default: "JPY", null: false
  end

  create_table "items", force: true do |t|
    t.string  "name"
    t.string  "description"
    t.decimal "price"
    t.integer "event_id"
    t.string  "image_url"
  end

  create_table "orderitems", force: true do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "quantity"
    t.string  "notes"
    t.boolean "ispurchased", default: false, null: false
  end

  create_table "orders", force: true do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.integer "buyer_id"
    t.integer "holder_id"
    t.integer "courier_id"
    t.boolean "isdelivered", default: false, null: false
  end

  create_table "trips", force: true do |t|
    t.integer  "user_id"
    t.string   "destination"
    t.datetime "startdate"
    t.datetime "enddate"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "instructions"
    t.boolean  "is_admin"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_approved",            default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
