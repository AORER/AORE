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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130327155134) do

  create_table "deals", :force => true do |t|
    t.integer  "purchaser_id"
    t.integer  "receiver_id"
    t.integer  "purchaser_bonus_points"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "points_for_distribution"
  end

  add_index "deals", ["created_at"], :name => "index_deals_on_created_at"
  add_index "deals", ["purchaser_id"], :name => "index_deals_on_purchaser_id"
  add_index "deals", ["receiver_id"], :name => "index_deals_on_receiver_id"

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.float    "original_price"
    t.float    "price_after_discount"
    t.integer  "used_points"
    t.integer  "new_points"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "purchases", ["user_id", "created_at"], :name => "index_purchases_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "remember_token"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
