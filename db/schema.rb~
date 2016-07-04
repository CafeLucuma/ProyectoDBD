# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160703235935) do

  create_table "attention_blocks", primary_key: "AB_ID", force: :cascade do |t|
    t.integer  "doctors_ID",     limit: 4, null: false
    t.integer  "SPEC_ID",        limit: 4, null: false
    t.date     "AB_DATE"
    t.time     "AB_START_TIME"
    t.time     "AB_FINISH_TIME"
    t.integer  "AB_EFFICIENCY",  limit: 4
    t.boolean  "AB_AVAILABLE"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attention_blocks", ["SPEC_ID"], name: "FK_TIENE_6", using: :btree
  add_index "attention_blocks", ["doctors_ID"], name: "FK_DISPONE_1", using: :btree

  create_table "attention_types", primary_key: "AT_ID", force: :cascade do |t|
    t.text "AT_attention_types", limit: 65535
  end

  create_table "cities", primary_key: "cities_ID", force: :cascade do |t|
    t.text "cities_NAME", limit: 65535
  end

  create_table "communes", primary_key: "communes_ID", force: :cascade do |t|
    t.integer "cities_ID",     limit: 4,     null: false
    t.text    "communes_NAME", limit: 65535
  end

  add_index "communes", ["cities_ID"], name: "FK_SE_ENCUENTRA", using: :btree

  create_table "doctor_specialties", id: false, force: :cascade do |t|
    t.integer "doctors_ID", limit: 4, null: false
    t.integer "SPEC_ID",    limit: 4, null: false
  end

  add_index "doctor_specialties", ["SPEC_ID"], name: "FK_MED_ESP2", using: :btree
  add_index "doctor_specialties", ["doctors_ID"], name: "FK_MEDICO_ESP1", using: :btree

  create_table "doctors", primary_key: "doctors_ID", force: :cascade do |t|
    t.integer  "EST_ID",     limit: 4, null: false
    t.integer  "users_ID",   limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "doctors", ["EST_ID"], name: "FK_PERTENECE_2", using: :btree
  add_index "doctors", ["users_ID"], name: "FK_SE_ASOCIA_1", using: :btree

  create_table "employees", primary_key: "employees_ID", force: :cascade do |t|
    t.integer  "users_ID",   limit: 4, null: false
    t.integer  "EST_ID",     limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["EST_ID"], name: "FK_PERTENECE_1", using: :btree
  add_index "employees", ["users_ID"], name: "FK_SE_ASOCIA_2", using: :btree

  create_table "establishment_attention_types", id: false, force: :cascade do |t|
    t.integer "AT_ID",  limit: 4, null: false
    t.integer "EST_ID", limit: 4, null: false
  end

  add_index "establishment_attention_types", ["AT_ID"], name: "FK_EST_TIPO_ATENCION", using: :btree
  add_index "establishment_attention_types", ["EST_ID"], name: "FK_EST_TIPO_AT", using: :btree

  create_table "establishments", primary_key: "EST_ID", force: :cascade do |t|
    t.integer "communes_ID", limit: 4,     null: false
    t.text    "EST_PHONE",   limit: 65535
    t.text    "EST_ADDRESS", limit: 65535
  end

  add_index "establishments", ["communes_ID"], name: "FK_ESTA_UBICADO", using: :btree

  create_table "id_card_types", primary_key: "ICT_ID", force: :cascade do |t|
    t.text "ICT_NATIONALITY", limit: 65535
  end

  create_table "patients", primary_key: "patients_ID", force: :cascade do |t|
    t.integer "users_ID",      limit: 4, null: false
    t.integer "previsions_ID", limit: 4, null: false
  end

  add_index "patients", ["previsions_ID"], name: "FK_TIENE_2", using: :btree
  add_index "patients", ["users_ID"], name: "FK_SE_ASOCIA_3", using: :btree

  create_table "previsions", primary_key: "previsions_ID", force: :cascade do |t|
    t.text "previsions_NAME", limit: 65535
  end

  create_table "profiles", primary_key: "profiles_ID", force: :cascade do |t|
    t.text "profiles_TYPE", limit: 65535
  end

  create_table "reports", primary_key: "reports_ID", force: :cascade do |t|
    t.integer "RH_ID",                      limit: 4,     null: false
    t.text    "reports_CONSULT_DIAGNOSIS",  limit: 65535
    t.text    "reports_CONSULT_RESOLUTION", limit: 65535
    t.text    "reports_OBSERVATION",        limit: 65535
  end

  add_index "reports", ["RH_ID"], name: "FK_SE_ASOCIA_5", using: :btree

  create_table "reserved_hours", primary_key: "RH_ID", force: :cascade do |t|
    t.integer  "patients_ID",    limit: 4, null: false
    t.integer  "AB_ID",          limit: 4, null: false
    t.time     "RH_START_TIME"
    t.time     "RH_FINISH_TIME"
    t.boolean  "RH_STATE"
    t.boolean  "RH_ASSISTANCE"
    t.boolean  "RH_DERIVED"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reserved_hours", ["AB_ID"], name: "FK_SE_ASOCIA_4", using: :btree
  add_index "reserved_hours", ["patients_ID"], name: "FK_ASIGNA_1", using: :btree

  create_table "specialties", primary_key: "SPEC_ID", force: :cascade do |t|
    t.integer "AT_ID",     limit: 4,     null: false
    t.text    "SPEC_NAME", limit: 65535
  end

  add_index "specialties", ["AT_ID"], name: "FK_TIENE_1", using: :btree

  create_table "user_profiles", id: false, force: :cascade do |t|
    t.integer "profiles_ID", limit: 4, null: false
    t.integer "users_ID",    limit: 4, null: false
  end

  add_index "user_profiles", ["profiles_ID"], name: "FK_PERFIL_USUARIO1", using: :btree
  add_index "user_profiles", ["users_ID"], name: "FK_PERFIL_USUARIO2", using: :btree

  create_table "users", primary_key: "users_ID", force: :cascade do |t|
    t.integer  "ICT_ID",                 limit: 4,                  null: false
    t.integer  "communes_ID",            limit: 4,                  null: false
    t.text     "users_ID_CARD",          limit: 65535
    t.text     "users_PASSWORD",         limit: 65535
    t.text     "users_NAMES",            limit: 65535
    t.text     "users_LASTNAME1",        limit: 65535
    t.text     "users_LASTNAME2",        limit: 65535
    t.date     "users_DATE_OF_BIRTH"
    t.text     "users_EMAIL",            limit: 65535
    t.text     "users_PHONE",            limit: 65535
    t.text     "users_CELLPHONE",        limit: 65535
    t.string   "users_SEX",              limit: 1
    t.text     "users_ADDRESS",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["ICT_ID"], name: "FK_POSEE_1", using: :btree
  add_index "users", ["communes_ID"], name: "FK_VIVE_EN", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "attention_blocks", "doctors", column: "doctors_ID", primary_key: "doctors_ID", name: "FK_DISPONE_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "attention_blocks", "specialties", column: "SPEC_ID", primary_key: "SPEC_ID", name: "FK_TIENE_6", on_update: :cascade, on_delete: :cascade
  add_foreign_key "communes", "cities", column: "cities_ID", primary_key: "cities_ID", name: "FK_SE_ENCUENTRA", on_update: :cascade, on_delete: :cascade
  add_foreign_key "doctor_specialties", "doctors", column: "doctors_ID", primary_key: "doctors_ID", name: "FK_MEDICO_ESP1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "doctor_specialties", "specialties", column: "SPEC_ID", primary_key: "SPEC_ID", name: "FK_MED_ESP2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "doctors", "establishments", column: "EST_ID", primary_key: "EST_ID", name: "FK_PERTENECE_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "doctors", "users", column: "users_ID", primary_key: "users_ID", name: "FK_SE_ASOCIA_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "employees", "establishments", column: "EST_ID", primary_key: "EST_ID", name: "FK_PERTENECE_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "employees", "users", column: "users_ID", primary_key: "users_ID", name: "FK_SE_ASOCIA_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "establishment_attention_types", "attention_types", column: "AT_ID", primary_key: "AT_ID", name: "FK_EST_TIPO_ATENCION", on_update: :cascade, on_delete: :cascade
  add_foreign_key "establishment_attention_types", "establishments", column: "EST_ID", primary_key: "EST_ID", name: "FK_EST_TIPO_AT", on_update: :cascade, on_delete: :cascade
  add_foreign_key "establishments", "communes", column: "communes_ID", primary_key: "communes_ID", name: "FK_ESTA_UBICADO", on_update: :cascade, on_delete: :cascade
  add_foreign_key "patients", "previsions", column: "previsions_ID", primary_key: "previsions_ID", name: "FK_TIENE_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "patients", "users", column: "users_ID", primary_key: "users_ID", name: "FK_SE_ASOCIA_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reports", "reserved_hours", column: "RH_ID", primary_key: "RH_ID", name: "FK_SE_ASOCIA_5", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reserved_hours", "attention_blocks", column: "AB_ID", primary_key: "AB_ID", name: "FK_SE_ASOCIA_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reserved_hours", "patients", column: "patients_ID", primary_key: "patients_ID", name: "FK_ASIGNA_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "specialties", "attention_types", column: "AT_ID", primary_key: "AT_ID", name: "FK_TIENE_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_profiles", "profiles", column: "profiles_ID", primary_key: "profiles_ID", name: "FK_PERFIL_USUARIO1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_profiles", "users", column: "users_ID", primary_key: "users_ID", name: "FK_PERFIL_USUARIO2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users", "communes", column: "communes_ID", primary_key: "communes_ID", name: "FK_VIVE_EN", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users", "id_card_types", column: "ICT_ID", primary_key: "ICT_ID", name: "FK_POSEE_1", on_update: :cascade, on_delete: :cascade
end
