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

ActiveRecord::Schema.define(version: 2023_02_06_113600) do

  create_table "bands", force: :cascade do |t|
    t.string "title"
    t.integer "foundation_year"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "score"
    t.string "owner_number"
    t.integer "band_id"
    t.index ["band_id"], name: "index_ratings_on_band_id"
    t.index ["owner_number", "band_id"], name: "index_ratings_on_owner_number_and_band_id", unique: true
  end

  create_table "user_last_responses", force: :cascade do |t|
    t.string "message"
    t.string "owner_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
