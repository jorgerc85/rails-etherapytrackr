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

ActiveRecord::Schema.define(version: 20150315053510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.text     "notes"
    t.integer  "test_id"
    t.integer  "patient_id"
    t.integer  "therapist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "score"
  end

  create_table "patient_therapists", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "therapist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "birthday"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "bottom_limit"
    t.float    "top_limit"
    t.string   "test_params"
  end

  create_table "therapists", force: :cascade do |t|
    t.string   "name"
    t.string   "profession"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
