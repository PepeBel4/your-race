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

ActiveRecord::Schema.define(version: 20171009143959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
  end

  create_table "competitors", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.string "email"
    t.string "country"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sailor_id"
    t.index ["group_id"], name: "index_competitors_on_group_id"
  end

  create_table "coordinates", force: :cascade do |t|
    t.datetime "timestamp"
    t.float "latitude"
    t.float "longitude"
    t.bigint "metric_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_coordinates_on_metric_id"
  end

  create_table "device_coordinates", force: :cascade do |t|
    t.string "device_id"
    t.datetime "timestamp"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finishes", force: :cascade do |t|
    t.bigint "race_competitor_id"
    t.bigint "metric_id"
    t.datetime "timestamp"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_finishes_on_metric_id"
    t.index ["race_competitor_id"], name: "index_finishes_on_race_competitor_id"
  end

  create_table "fleets", force: :cascade do |t|
    t.string "name"
    t.string "fleet_type"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_fleets_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "competition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_groups_on_competition_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "name"
    t.string "metric_type"
    t.bigint "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tracking_device"
    t.index ["race_id"], name: "index_metrics_on_race_id"
  end

  create_table "race_competitors", force: :cascade do |t|
    t.bigint "competitor_id"
    t.bigint "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competitor_id"], name: "index_race_competitors_on_competitor_id"
    t.index ["race_id"], name: "index_race_competitors_on_race_id"
  end

  create_table "race_scorings", force: :cascade do |t|
    t.bigint "race_competitor_id"
    t.bigint "race_id"
    t.integer "position"
    t.float "points"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_competitor_id"], name: "index_race_scorings_on_race_competitor_id"
    t.index ["race_id"], name: "index_race_scorings_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.string "race_type"
    t.integer "race_order"
    t.boolean "final"
    t.bigint "fleet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "canceled_at"
    t.string "aasm_state"
    t.datetime "scheduled_for"
    t.boolean "individual_recall"
    t.index ["fleet_id"], name: "index_races_on_fleet_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sailors", force: :cascade do |t|
    t.integer "member_id"
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "country"
    t.string "resident_country"
    t.string "hometown"
    t.string "gender"
    t.date "birthday"
    t.string "classification"
    t.date "classification_expiry_date"
    t.string "marital"
    t.integer "children"
    t.string "occupation"
    t.string "yatch_club"
    t.string "yatch_club_location"
    t.string "coach"
    t.string "coached_since"
    t.string "languages"
    t.string "education"
    t.string "campaign_website"
    t.string "email"
    t.string "first_boat_sailed"
    t.string "start_sailing_at_age"
    t.string "start_racing_at_age"
    t.string "current_classes_sailed"
    t.string "previous_classes_sailed"
    t.string "first_event"
    t.string "first_event_won"
    t.string "avatar_remote_url"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.bigint "competitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competitor_id"], name: "index_sailors_on_competitor_id"
  end

  create_table "scorings", force: :cascade do |t|
    t.float "points"
    t.float "discards"
    t.float "points_with_discards"
    t.integer "race_positions", default: [], array: true
    t.float "race_points", default: [], array: true
    t.string "race_comments", default: [], array: true
    t.bigint "group_id"
    t.bigint "competitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competitor_id"], name: "index_scorings_on_competitor_id"
    t.index ["group_id"], name: "index_scorings_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "competitors", "groups"
  add_foreign_key "coordinates", "metrics"
  add_foreign_key "finishes", "metrics"
  add_foreign_key "finishes", "race_competitors"
  add_foreign_key "fleets", "groups"
  add_foreign_key "groups", "competitions"
  add_foreign_key "metrics", "races"
  add_foreign_key "race_competitors", "competitors"
  add_foreign_key "race_competitors", "races"
  add_foreign_key "race_scorings", "race_competitors"
  add_foreign_key "race_scorings", "races"
  add_foreign_key "races", "fleets"
  add_foreign_key "sailors", "competitors"
  add_foreign_key "scorings", "competitors"
  add_foreign_key "scorings", "groups"
end
