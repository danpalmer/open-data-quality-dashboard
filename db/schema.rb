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

ActiveRecord::Schema.define(version: 20140308222753) do

  create_table "departments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "publishes_as"
  end

  create_table "resources", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "department_id"
    t.boolean  "exists"
    t.boolean  "has_sane_filename"
    t.boolean  "has_extension"
  end

  add_index "resources", ["department_id"], name: "index_resources_on_department_id"

  create_table "score_criteria", force: true do |t|
    t.string   "name"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "department_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["department_id"], name: "index_scores_on_department_id"

  create_table "scores_score_criteria", force: true do |t|
    t.integer "score_id"
    t.integer "score_criteria_id"
  end

  add_index "scores_score_criteria", ["score_id", "score_criteria_id"], name: "index_scores_score_criteria_on_score_id_and_score_criteria_id"

end
