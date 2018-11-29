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

ActiveRecord::Schema.define(version: 2018_11_29_201638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "phase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_id"
    t.index ["tournament_id"], name: "index_categories_on_tournament_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_groups_on_category_id"
  end

  create_table "groups_participants", id: false, force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "group_id", null: false
    t.index ["group_id", "participant_id"], name: "index_groups_participants_on_group_id_and_participant_id"
  end

  create_table "judges", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.string "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "judge_id"
    t.bigint "participant_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_scores_on_group_id"
    t.index ["judge_id"], name: "index_scores_on_judge_id"
    t.index ["participant_id"], name: "index_scores_on_participant_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.string "start_date"
    t.string "final_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "tournaments"
  add_foreign_key "groups", "categories"
  add_foreign_key "scores", "groups"
  add_foreign_key "scores", "judges"
  add_foreign_key "scores", "participants"
end
