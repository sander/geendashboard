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

ActiveRecord::Schema.define(version: 20130721232625) do

  create_table "involvements", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "involvements", ["project_id"], name: "index_involvements_on_project_id"
  add_index "involvements", ["role_id"], name: "index_involvements_on_role_id"
  add_index "involvements", ["user_id"], name: "index_involvements_on_user_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "goal"
    t.boolean  "visible"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.boolean  "can_write"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "wunderlist_accounts", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wunderlist_accounts", ["user_id"], name: "index_wunderlist_accounts_on_user_id"

  create_table "wunderlist_task_lists", force: true do |t|
    t.integer  "project_id"
    t.string   "wunderlist_id"
    t.integer  "wunderlist_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tasks"
  end

  add_index "wunderlist_task_lists", ["project_id"], name: "index_wunderlist_task_lists_on_project_id"
  add_index "wunderlist_task_lists", ["wunderlist_account_id"], name: "index_wunderlist_task_lists_on_wunderlist_account_id"

end
