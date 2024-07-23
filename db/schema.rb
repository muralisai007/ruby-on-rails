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

ActiveRecord::Schema[7.1].define(version: 2024_06_27_065446) do
  create_table "employeelists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone_no"
    t.string "email"
    t.date "date_of_birth"
    t.string "aadhaar_input"
    t.string "designation"
    t.integer "status"
    t.float "salary"
    t.integer "extra_leaves", default: 0
    t.float "salary_disbursed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "deductions"
    t.float "adjusted_salary"
    t.float "total_annual_salary"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone_no"
    t.string "email"
    t.date "date_of_birth"
    t.string "aadhaar_input"
    t.string "designation"
    t.integer "status"
    t.float "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaveslists", force: :cascade do |t|
    t.json "default_leaves"
    t.json "extra_leaves"
    t.json "deductions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employeelist_id", null: false
    t.json "leaves_data", default: {"default_leaves"=>{"january"=>0, "february"=>0, "march"=>0, "april"=>0, "may"=>0, "june"=>0, "july"=>0, "august"=>0, "september"=>0, "october"=>0, "november"=>0, "december"=>0}, "extra_leaves"=>{"january"=>0, "february"=>0, "march"=>0, "april"=>0, "may"=>0, "june"=>0, "july"=>0, "august"=>0, "september"=>0, "october"=>0, "november"=>0, "december"=>0}, "deductions"=>{"january"=>0, "february"=>0, "march"=>0, "april"=>0, "may"=>0, "june"=>0, "july"=>0, "august"=>0, "september"=>0, "october"=>0, "november"=>0, "december"=>0}}
    t.string "month"
    t.index ["employeelist_id"], name: "index_leaveslists_on_employeelist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "leaveslists", "employeelists"
end
