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

ActiveRecord::Schema[8.0].define(version: 2025_02_22_094425) do
  create_schema "auth"
  create_schema "extensions"
  create_schema "graphql"
  create_schema "graphql_public"
  create_schema "pgbouncer"
  create_schema "pgsodium"
  create_schema "pgsodium_masks"
  create_schema "realtime"
  create_schema "storage"
  create_schema "vault"

  # These are extensions that must be enabled in order to support this database
  enable_extension "extensions.pg_stat_statements"
  enable_extension "extensions.pgcrypto"
  enable_extension "extensions.pgjwt"
  enable_extension "extensions.uuid-ossp"
  enable_extension "graphql.pg_graphql"
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgsodium.pgsodium"
  enable_extension "vault.supabase_vault"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.boolean "active_status", default: true, null: false
    t.boolean "del_status", default: false, null: false
    t.string "region", null: false
    t.string "residence", null: false
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_status", "del_status"], name: "index_contacts_on_active_status_and_del_status"
    t.index ["email"], name: "index_contacts_on_email", unique: true
    t.index ["location_id"], name: "index_contacts_on_location_id"
    t.index ["phone_number"], name: "index_contacts_on_phone_number", unique: true
    t.index ["region"], name: "index_contacts_on_region"
    t.index ["residence"], name: "index_contacts_on_residence"
  end

  create_table "entity_infos", force: :cascade do |t|
    t.string "assigned_code", null: false
    t.string "entity_name", null: false
    t.string "entity_alias", limit: 50, null: false
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_status", "del_status"], name: "index_entity_infos_on_active_status_and_del_status"
    t.index ["assigned_code"], name: "index_entity_infos_on_assigned_code", unique: true
    t.index ["entity_alias"], name: "index_entity_infos_on_entity_alias", unique: true, where: "(entity_alias IS NOT NULL)"
    t.index ["entity_name"], name: "index_entity_infos_on_entity_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "region", null: false
    t.string "residence", null: false
    t.boolean "active_status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_status"], name: "index_locations_on_active_status"
    t.index ["region", "residence"], name: "index_locations_on_region_and_residence", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.string "subject_class"
    t.string "action"
    t.string "name"
    t.string "comment"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions_roles", force: :cascade do |t|
    t.integer "permission_id"
    t.string "role_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "role_code"
    t.string "role_type"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "role_code", null: false
    t.string "user_code"
    t.string "entity_code"
    t.string "creator_id"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_code", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.string "mobile_number", null: false
    t.string "image_path"
    t.boolean "first_login", default: true, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.string "creator_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(active_status = true)"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, where: "(active_status = true)"
    t.index ["user_code"], name: "index_users_on_user_code", unique: true, where: "(active_status = true)"
    t.index ["username"], name: "index_users_on_username", unique: true, where: "(active_status = true)"
  end
end
