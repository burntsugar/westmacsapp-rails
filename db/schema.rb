# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_24_031325) do

  create_table "facilities", force: :cascade do |t|
    t.integer "name_type"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "observations", force: :cascade do |t|
    t.string "author_name"
    t.text "note"
    t.datetime "log_date"
    t.string "loggable_type"
    t.integer "loggable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loggable_type", "loggable_id"], name: "index_observations_on_loggable_type_and_loggable_id"
  end

  create_table "trail_sites", force: :cascade do |t|
    t.boolean "is_trail_head", default: false, null: false
    t.integer "section_number", null: false
    t.float "distance_from_trail_start", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.decimal "latitude", precision: 10, scale: 6, default: "0.0"
    t.decimal "longitude", precision: 10, scale: 6, default: "0.0"
    t.decimal "elevation", precision: 6, scale: 2, default: "0.0"
    t.index ["name"], name: "index_trail_sites_on_name", unique: true
  end

end
