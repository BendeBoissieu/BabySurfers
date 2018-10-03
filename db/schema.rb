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

ActiveRecord::Schema.define(version: 2018_10_03_093805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discussions", force: :cascade do |t|
    t.text "message_event"
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_discussions_on_event_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title_event"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "photo_event"
    t.string "organiser"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organiser_id"
    t.float "latitude"
    t.float "longitude"
    t.string "location"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "joins", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_joins_on_event_id"
    t.index ["user_id"], name: "index_joins_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.string "background_profile"
    t.date "birth_date"
    t.string "board_type"
    t.string "need_to_rent"
    t.string "surf_level"
    t.string "favorite_beach"
    t.string "i_like"
    t.text "description_user"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photoprofile"
    t.string "phone"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "discussions", "events"
  add_foreign_key "discussions", "users"
  add_foreign_key "events", "users"
  add_foreign_key "joins", "events"
  add_foreign_key "joins", "users"
  add_foreign_key "profiles", "users"
end
