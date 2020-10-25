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

ActiveRecord::Schema.define(version: 2020_10_25_010205) do

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
    t.boolean "is_trail_head"
    t.integer "section_number"
    t.float "distance_from_trail_start"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
