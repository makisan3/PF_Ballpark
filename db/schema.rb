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

ActiveRecord::Schema.define(version: 2021_09_01_113314) do

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.integer "player_id"
    t.integer "school_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "player_id"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_likes_on_player_id"
    t.index ["school_id"], name: "index_likes_on_school_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "player_id"
    t.integer "school_id"
    t.integer "room_id"
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.integer "grade", null: false
    t.string "school", null: false
    t.string "enrollment", null: false
    t.integer "base", null: false
    t.string "player_image_id"
    t.text "player_pr"
    t.boolean "player_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.integer "player_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "score", precision: 5, scale: 3
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "high_school_name", null: false
    t.string "manager_name"
    t.integer "spring_koshien_times", null: false
    t.integer "summer_koshien_times", null: false
    t.string "address", null: false
    t.integer "dormitory", null: false
    t.string "high_school_image_id"
    t.text "high_school_pr"
    t.boolean "school_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_schools_on_email", unique: true
    t.index ["reset_password_token"], name: "index_schools_on_reset_password_token", unique: true
  end

end
