# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_13_092323) do
  create_table "results", force: :cascade do |t|
    t.string "input", null: false
    t.string "iterations", null: false
    t.integer "gcd", null: false
    t.integer "lcm", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["input"], name: "index_results_on_input", unique: true
  end

end
