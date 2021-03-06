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

ActiveRecord::Schema.define(version: 20140922234206) do

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.integer  "viewed",             default: 0
  end

  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id"

  create_table "blogs_galleries", force: true do |t|
    t.integer "blog_id"
    t.integer "gallery_id"
  end

  create_table "galleries", force: true do |t|
    t.text     "name"
    t.string   "setid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "viewed",             default: 0
  end

  add_index "galleries", ["user_id"], name: "index_galleries_on_user_id"

  create_table "galleries_tournaments", force: true do |t|
    t.integer "gallery_id"
    t.integer "tournament_id"
  end

  create_table "images", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.datetime "photo_updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.datetime "photo_updated_at"
  end

  create_table "tournaments_users", force: true do |t|
    t.integer "tournament_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "fullname"
    t.string   "email"
    t.string   "remember_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.datetime "photo_updated_at"
    t.text     "description"
    t.integer  "sign_in_counter",    default: 0
  end

end
