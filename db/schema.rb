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

ActiveRecord::Schema[7.1].define(version: 2024_04_23_141250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "coaching_program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coaching_program_id"], name: "index_assignments_on_coaching_program_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "expertise"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_coaches_on_email", unique: true
    t.index ["reset_password_token"], name: "index_coaches_on_reset_password_token", unique: true
  end

  create_table "coaches_coaching_programs", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.bigint "coaching_program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_coaches_coaching_programs_on_coach_id"
    t.index ["coaching_program_id"], name: "index_coaches_coaching_programs_on_coaching_program_id"
  end

  create_table "coaching_programs", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_coaching_programs_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_assignments", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "assignment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_employee_assignments_on_assignment_id"
    t.index ["employee_id"], name: "index_employee_assignments_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.text "coaching_requirements"
    t.string "address"
    t.string "encrypted_password", default: "", null: false
    t.bigint "company_id", null: false
    t.bigint "coaching_program_id", null: false
    t.bigint "coach_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_employees_on_coach_id"
    t.index ["coaching_program_id"], name: "index_employees_on_coaching_program_id"
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "coaching_programs"
  add_foreign_key "coaches_coaching_programs", "coaches"
  add_foreign_key "coaches_coaching_programs", "coaching_programs"
  add_foreign_key "coaching_programs", "companies"
  add_foreign_key "employee_assignments", "assignments"
  add_foreign_key "employee_assignments", "employees"
  add_foreign_key "employees", "coaches"
  add_foreign_key "employees", "coaching_programs"
  add_foreign_key "employees", "companies"
end
