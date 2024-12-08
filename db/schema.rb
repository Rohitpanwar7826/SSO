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

ActiveRecord::Schema[7.0].define(version: 2024_11_06_190911) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "subdomain"
    t.string "identifier"
    t.string "custom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
  end

  create_table "plans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "no_users"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "details", default: [], array: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "sso_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sso_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sso_users_on_reset_password_token", unique: true
  end

  create_table "sso_users_roles", id: false, force: :cascade do |t|
    t.bigint "sso_user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_sso_users_roles_on_role_id"
    t.index ["sso_user_id", "role_id"], name: "index_sso_users_roles_on_sso_user_id_and_role_id"
    t.index ["sso_user_id"], name: "index_sso_users_roles_on_sso_user_id"
  end

  create_table "sso_users_tenants_organizations", id: false, force: :cascade do |t|
    t.bigint "sso_user_id", null: false
    t.bigint "tenants_organization_id", null: false
    t.index ["sso_user_id", "tenants_organization_id"], name: "user_organization"
  end

  create_table "tenants_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "long_name"
    t.text "svg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants_organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "follback_page_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants_user_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "sso_user_id", null: false
    t.uuid "application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_tenants_user_applications_on_application_id"
    t.index ["sso_user_id"], name: "index_tenants_user_applications_on_sso_user_id"
  end

  create_table "tenants_user_organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "sso_user_id", null: false
    t.uuid "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_tenants_user_organizations_on_organization_id"
    t.index ["sso_user_id"], name: "index_tenants_user_organizations_on_sso_user_id"
  end

  add_foreign_key "tenants_user_applications", "sso_users"
  add_foreign_key "tenants_user_applications", "tenants_applications", column: "application_id"
  add_foreign_key "tenants_user_organizations", "sso_users"
  add_foreign_key "tenants_user_organizations", "tenants_organizations", column: "organization_id"
end
