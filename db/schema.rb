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

ActiveRecord::Schema.define(version: 20160913190204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "companies", force: :cascade do |t|
    t.citext   "subdomain",  null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdomain"], name: "index_companies_on_subdomain", unique: true, using: :btree
  end

  create_table "credentials", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_credentials_on_company_id", using: :btree
    t.index ["role_id"], name: "index_credentials_on_role_id", using: :btree
    t.index ["user_id"], name: "index_credentials_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.citext   "name",        null: false
    t.jsonb    "permissions"
    t.integer  "company_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_roles_on_company_id", using: :btree
    t.index ["name", "company_id"], name: "index_roles_on_name_and_company_id", unique: true, using: :btree
    t.index ["permissions"], name: "index_roles_on_permissions", using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.citext   "username"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "users_companies", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_companies_on_company_id", using: :btree
    t.index ["user_id"], name: "index_users_companies_on_user_id", using: :btree
  end

  add_foreign_key "credentials", "companies"
  add_foreign_key "credentials", "roles"
  add_foreign_key "credentials", "users"
  add_foreign_key "roles", "companies"
  add_foreign_key "users_companies", "companies"
  add_foreign_key "users_companies", "users"
end
