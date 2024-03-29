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

ActiveRecord::Schema.define(version: 20150716220745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.integer  "calories"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date_performed"
  end

  create_table "exercises_users", force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "user_id"
  end

  add_index "exercises_users", ["exercise_id"], name: "index_exercises_users_on_exercise_id", using: :btree
  add_index "exercises_users", ["user_id"], name: "index_exercises_users_on_user_id", using: :btree

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.integer  "calories"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date_consumed"
  end

  create_table "foods_users", force: :cascade do |t|
    t.integer "food_id"
    t.integer "user_id"
  end

  add_index "foods_users", ["food_id"], name: "index_foods_users_on_food_id", using: :btree
  add_index "foods_users", ["user_id"], name: "index_foods_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
