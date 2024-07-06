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

ActiveRecord::Schema[7.1].define(version: 2024_07_06_214006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "legal_name"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_lawsuits", id: false, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "lawsuit_id", null: false
    t.index ["company_id", "lawsuit_id"], name: "index_companies_lawsuits_on_company_id_and_lawsuit_id"
    t.index ["lawsuit_id", "company_id"], name: "index_companies_lawsuits_on_lawsuit_id_and_company_id"
  end

  create_table "lawsuits", force: :cascade do |t|
    t.bigint "tenancy_id", null: false
    t.string "alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_of"
    t.index ["tenancy_id"], name: "index_lawsuits_on_tenancy_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "published"
    t.bigint "lawsuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawsuit_id"], name: "index_reports_on_lawsuit_id"
  end

  create_table "tenancies", force: :cascade do |t|
    t.string "name"
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
    t.string "role"
    t.bigint "tenancy_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tenancy_id"], name: "index_users_on_tenancy_id"
  end

  add_foreign_key "lawsuits", "tenancies"
  add_foreign_key "reports", "lawsuits"
  add_foreign_key "users", "tenancies"
end
