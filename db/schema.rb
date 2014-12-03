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

ActiveRecord::Schema.define(version: 20141203030348) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "location"
    t.string   "url"
  end

  create_table "items", force: true do |t|
    t.string  "name"
    t.string  "description"
    t.decimal "price"
    t.integer "eventid"
    t.string  "imageurl"
  end

  create_table "orderitems", force: true do |t|
    t.integer "orderid"
    t.integer "itemid"
    t.integer "quantity"
  end

  create_table "orders", force: true do |t|
    t.integer "userid"
    t.integer "eventid"
    t.integer "buyerid"
    t.integer "holderid"
    t.integer "courierid"
  end

  create_table "trips", force: true do |t|
    t.integer  "userid"
    t.string   "destination"
    t.datetime "startdate"
    t.datetime "enddate"
  end

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "instructions"
    t.boolean "is_admin"
  end

end
