# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101207091548) do

  create_table "listings", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "category"
    t.integer  "zipcode"
    t.text     "description"
    t.decimal  "approx_payment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",          :default => true
    t.float    "worker_rating"
    t.float    "employer_rating"
  end

  create_table "messages", :force => true do |t|
    t.integer  "from"
    t.integer  "to"
    t.integer  "listing_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.decimal  "amount"
    t.decimal  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accepted",   :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.integer  "zipcode"
    t.decimal  "employer_rating"
    t.integer  "num_eratings"
    t.decimal  "worker_rating"
    t.integer  "num_wratings"
    t.text     "description"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
