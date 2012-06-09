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

ActiveRecord::Schema.define(:version => 20120321085401) do

  create_table "activity_logs", :force => true do |t|
    t.string   "username"
    t.string   "activity"
    t.string   "details"
    t.string   "details2"
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "extended_description"
    t.string   "location_city"
    t.string   "location_street"
    t.string   "location_building"
    t.integer  "start_hour"
    t.integer  "start_min"
    t.text     "start_ti"
    t.integer  "end_hour"
    t.integer  "end_min"
    t.text     "end_ti"
    t.integer  "capacity"
    t.integer  "cellnum"
    t.integer  "price"
    t.string   "host_name"
    t.integer  "start_date_mm"
    t.integer  "start_date_dd_"
    t.integer  "start_date_yyyy"
    t.integer  "end_date_mm"
    t.integer  "end_date_dd"
    t.integer  "end_date_yyyy"
    t.integer  "reserved"
    t.integer  "attending"
  end

  create_table "notices", :force => true do |t|
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "organizer_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizers", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "fname"
    t.string   "mname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userevents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "fname"
    t.string   "minitial"
    t.string   "lname"
    t.string   "address"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cellnum"
    t.integer  "almonds"
  end

end
