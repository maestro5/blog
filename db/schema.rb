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

ActiveRecord::Schema.define(version: 20151004191558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string   "data"
    t.string   "filename"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "assets", ["assetable_type", "assetable_id"], name: "index_assets_on_assetable_type_and_assetable_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "author_name"
    t.string   "author_email"
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "body"
    t.string   "author"
    t.string   "address"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
