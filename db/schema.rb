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

ActiveRecord::Schema.define(version: 20140330193844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name",                     null: false
    t.string   "subdomain",                null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name",                     null: false
    t.string   "zip_code",                 null: false
    t.integer  "state_id",                 null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["account_id"], name: "index_cities_on_account_id", using: :btree
  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name",                     null: false
    t.string   "tax_id"
    t.string   "address"
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["account_id"], name: "index_companies_on_account_id", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["tax_id"], name: "index_companies_on_tax_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name",                       null: false
    t.string   "lastname",                   null: false
    t.string   "identification",             null: false
    t.string   "tax_id"
    t.string   "email"
    t.string   "address",                    null: false
    t.integer  "profile_id",                 null: false
    t.string   "profile_type",               null: false
    t.integer  "city_id",                    null: false
    t.integer  "account_id",                 null: false
    t.integer  "lock_version",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["account_id"], name: "index_customers_on_account_id", using: :btree
  add_index "customers", ["city_id"], name: "index_customers_on_city_id", using: :btree
  add_index "customers", ["identification"], name: "index_customers_on_identification", using: :btree
  add_index "customers", ["lastname"], name: "index_customers_on_lastname", using: :btree
  add_index "customers", ["name"], name: "index_customers_on_name", using: :btree
  add_index "customers", ["profile_id", "profile_type"], name: "index_customers_on_profile_id_and_profile_type", using: :btree
  add_index "customers", ["tax_id"], name: "index_customers_on_tax_id", using: :btree

  create_table "departments", force: true do |t|
    t.string   "name",            null: false
    t.integer  "organization_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["name"], name: "index_departments_on_name", using: :btree
  add_index "departments", ["organization_id"], name: "index_departments_on_organization_id", using: :btree

  create_table "loans", force: true do |t|
    t.string   "status",                                          default: "current", null: false
    t.decimal  "amount",                 precision: 15, scale: 2,                     null: false
    t.integer  "payments_count",                                                      null: false
    t.integer  "progress",                                        default: 0,         null: false
    t.date     "next_payment_expire_at"
    t.date     "expire_at",                                                           null: false
    t.date     "canceled_at"
    t.integer  "customer_id",                                                         null: false
    t.integer  "user_id",                                                             null: false
    t.integer  "account_id",                                                          null: false
    t.integer  "lock_version",                                    default: 0,         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loans", ["account_id"], name: "index_loans_on_account_id", using: :btree
  add_index "loans", ["canceled_at"], name: "index_loans_on_canceled_at", using: :btree
  add_index "loans", ["customer_id"], name: "index_loans_on_customer_id", using: :btree
  add_index "loans", ["expire_at"], name: "index_loans_on_expire_at", using: :btree
  add_index "loans", ["next_payment_expire_at"], name: "index_loans_on_next_payment_expire_at", using: :btree
  add_index "loans", ["progress"], name: "index_loans_on_progress", using: :btree
  add_index "loans", ["status"], name: "index_loans_on_status", using: :btree
  add_index "loans", ["user_id"], name: "index_loans_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["account_id"], name: "index_organizations_on_account_id", using: :btree
  add_index "organizations", ["name"], name: "index_organizations_on_name", using: :btree

  create_table "payments", force: true do |t|
    t.integer  "number",                              null: false
    t.decimal  "payment",    precision: 15, scale: 2, null: false
    t.date     "expire_at",                           null: false
    t.datetime "paid_at"
    t.integer  "loan_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["expire_at"], name: "index_payments_on_expire_at", using: :btree
  add_index "payments", ["loan_id"], name: "index_payments_on_loan_id", using: :btree
  add_index "payments", ["number"], name: "index_payments_on_number", using: :btree
  add_index "payments", ["paid_at"], name: "index_payments_on_paid_at", using: :btree

  create_table "phones", force: true do |t|
    t.string   "phone",         null: false
    t.integer  "phonable_id"
    t.string   "phonable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["phonable_id", "phonable_type"], name: "index_phones_on_phonable_id_and_phonable_type", using: :btree

  create_table "private_customers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_customers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rate_sets", force: true do |t|
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rate_sets", ["account_id"], name: "index_rate_sets_on_account_id", using: :btree

  create_table "rates", force: true do |t|
    t.integer  "payments_count",                          null: false
    t.decimal  "rate",           precision: 15, scale: 5, null: false
    t.integer  "rate_set_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rate_set_id"], name: "index_rates_on_rate_set_id", using: :btree

  create_table "reminders", force: true do |t|
    t.datetime "remind_at",                    null: false
    t.string   "kind",                         null: false
    t.boolean  "notified",     default: false, null: false
    t.boolean  "scheduled",    default: false, null: false
    t.integer  "schedule_id",                  null: false
    t.integer  "lock_version", default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reminders", ["schedule_id"], name: "index_reminders_on_schedule_id", using: :btree

  create_table "schedules", force: true do |t|
    t.text     "description",                      null: false
    t.datetime "scheduled_at",                     null: false
    t.boolean  "done",             default: false, null: false
    t.integer  "user_id",                          null: false
    t.integer  "schedulable_id"
    t.string   "schedulable_type"
    t.integer  "account_id",                       null: false
    t.integer  "lock_version",     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["account_id"], name: "index_schedules_on_account_id", using: :btree
  add_index "schedules", ["schedulable_id", "schedulable_type"], name: "index_schedules_on_schedulable_id_and_schedulable_type", using: :btree
  add_index "schedules", ["scheduled_at"], name: "index_schedules_on_scheduled_at", using: :btree
  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["account_id"], name: "index_states_on_account_id", using: :btree

  create_table "tax_settings", force: true do |t|
    t.string   "name",                                              null: false
    t.decimal  "value",        precision: 15, scale: 2,             null: false
    t.integer  "account_id",                                        null: false
    t.integer  "lock_version",                          default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tax_settings", ["account_id"], name: "index_tax_settings_on_account_id", using: :btree
  add_index "tax_settings", ["name"], name: "index_tax_settings_on_name", using: :btree

  create_table "taxes", force: true do |t|
    t.decimal  "value",          precision: 15, scale: 2, null: false
    t.integer  "tax_setting_id",                          null: false
    t.integer  "payment_id",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taxes", ["payment_id"], name: "index_taxes_on_payment_id", using: :btree
  add_index "taxes", ["tax_setting_id"], name: "index_taxes_on_tax_setting_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                               null: false
    t.string   "lastname",                           null: false
    t.string   "email",                              null: false
    t.string   "password_digest",                    null: false
    t.integer  "account_id",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token",                         null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "lock_version",           default: 0, null: false
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["password_reset_token"], name: "index_users_on_password_reset_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.integer  "item_id",    null: false
    t.string   "item_type",  null: false
    t.integer  "account_id"
    t.string   "event",      null: false
    t.integer  "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["account_id"], name: "index_versions_on_account_id", using: :btree
  add_index "versions", ["item_id", "item_type"], name: "index_versions_on_item_id_and_item_type", using: :btree

end
