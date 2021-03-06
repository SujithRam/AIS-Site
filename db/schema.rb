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

ActiveRecord::Schema.define(version: 20170516184003) do

  create_table "reg_disables", force: :cascade do |t|
    t.string   "studentreg"
    t.string   "utsavseatreg"
    t.string   "utsavpartreg"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "regdisables", force: :cascade do |t|
    t.string   "pgname"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "fmlocation"
    t.string   "flightno"
    t.string   "password_digest"
    t.datetime "landingtime"
    t.string   "needpickup"
    t.string   "needaccom"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "normuser",        default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "normuser"
  end

  create_table "utsav_registrations", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "typeofpart"
    t.string   "grpdetails"
    t.string   "group"
    t.string   "otheractiv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "utsav_seats", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "grpdetails"
    t.string   "group"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "people"
    t.string   "member"
    t.string   "confirmation"
    t.string   "tableno"
  end

end
