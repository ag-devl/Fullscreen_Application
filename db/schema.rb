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

ActiveRecord::Schema.define(version: 20140818204421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "preferences", force: true do |t|
    t.integer  "userid"
    t.integer  "videoid"
    t.boolean  "likes"
    t.boolean  "dislikes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "transactions", force: true do |t|
    t.integer  "userid"
    t.integer  "videoid"
    t.integer  "likes"
    t.integer  "dislikes"
    t.boolean  "skip_ad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "name",     limit: 100
    t.string "email",    limit: 100
    t.string "country",  limit: 100
    t.string "password", limit: 100
  end

  create_table "videoshops", force: true do |t|
    t.string   "name"
    t.integer  "videoid"
    t.integer  "views"
    t.string   "prerollads"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videoshops", ["videoid"], name: "index_videoshops_on_videoid", using: :btree
  add_index "videoshops", ["videoid"], name: "video_index", using: :btree

end
