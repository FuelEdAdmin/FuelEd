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

ActiveRecord::Schema.define(version: 20131125002834) do

  create_table "appointments", force: true do |t|
    t.string   "client"
    t.string   "intern"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "school"
    t.string   "room"
    t.integer  "school_id"
    t.integer  "user_id"
  end

  create_table "identities", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "state"
    t.string   "county"
    t.string   "city"
    t.string   "address"
    t.integer  "zipcode",    limit: 255
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "school"
    t.string   "rank"
  end

  create_table "users_schools", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "school_id"
  end

  add_index "users_schools", ["user_id", "school_id"], name: "index_users_schools_on_user_id_and_school_id"
  add_index "users_schools", ["user_id"], name: "index_users_schools_on_user_id"

end
