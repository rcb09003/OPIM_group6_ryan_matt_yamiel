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

ActiveRecord::Schema.define(version: 20131204201630) do

  create_table "applicants", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "position"
    t.string   "employed"
    t.decimal  "salary"
    t.datetime "start_date"
    t.string   "education"
    t.string   "skills"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "rating"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "event_type"
    t.string   "admission_type"
    t.datetime "event_time"
    t.string   "location"
    t.decimal  "starting_bid"
    t.decimal  "buy_price"
    t.datetime "bid_end"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.integer  "buy_user",       default: 0
    t.integer  "bid_user",       default: 0
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
