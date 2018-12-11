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

ActiveRecord::Schema.define(version: 2018_12_10_164658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_participants", id: false, force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "category_id", null: false
    t.index ["participant_id", "category_id"], name: "index_categories_participants_on_participant_id_and_category_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "phase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_groups_on_category_id"
  end

  create_table "participant_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "participant_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_participant_groups_on_group_id"
    t.index ["participant_id"], name: "index_participant_groups_on_participant_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournament_categories", force: :cascade do |t|
    t.integer "participants_per_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "tournament_id"
    t.index ["category_id"], name: "index_tournament_categories_on_category_id"
    t.index ["tournament_id"], name: "index_tournament_categories_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.date "start_date"
    t.date "final_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "groups", "categories"
  add_foreign_key "participant_groups", "groups"
  add_foreign_key "participant_groups", "participants"
  add_foreign_key "tournament_categories", "categories"
  add_foreign_key "tournament_categories", "tournaments"
end
