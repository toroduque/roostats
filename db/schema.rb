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

ActiveRecord::Schema.define(version: 20161205125144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "contract_type",  limit: 50, null: false
    t.string   "vehicle",        limit: 50, null: false
    t.integer  "salary_hour"
    t.integer  "salary_dropoff"
    t.integer  "rider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "earnings", force: :cascade do |t|
    t.date     "earnings_date", null: false
    t.integer  "hours",         null: false
    t.integer  "orders",        null: false
    t.integer  "tips"
    t.integer  "rider_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "riders", force: :cascade do |t|
    t.string   "first_name",             limit: 50,               null: false
    t.string   "last_name",              limit: 50,               null: false
    t.string   "city",                   limit: 50
    t.string   "email",                  limit: 255,              null: false
    t.string   "password",               limit: 50,               null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_riders_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_riders_on_reset_password_token", unique: true, using: :btree
  end

end
