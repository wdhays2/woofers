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

ActiveRecord::Schema.define(version: 20150912232637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.integer "manufacturer_id",      null: false
    t.float   "size"
    t.float   "cut_out"
    t.string  "model_no"
    t.string  "link"
    t.float   "ohms"
    t.integer "rms_power"
    t.integer "sensitivity"
    t.float   "x_max"
    t.float   "fs"
    t.float   "vas"
    t.float   "qts"
    t.integer "low_frequency_limit"
    t.integer "high_frequency_limit"
    t.float   "sealed_volume"
    t.integer "sealed_f3"
    t.float   "vented_volume"
    t.integer "vented_f3"
  end

  add_index "drivers", ["manufacturer_id"], name: "index_drivers_on_manufacturer_id", using: :btree

  create_table "manufacturers", force: :cascade do |t|
    t.string "name", null: false
  end

  add_index "manufacturers", ["name"], name: "index_manufacturers_on_name", using: :btree

end
