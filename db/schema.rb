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

ActiveRecord::Schema.define(version: 20140507123644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "subdomain",                null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["subdomain"], name: "index_accounts_on_subdomain", using: :btree

  create_table "cities", force: :cascade do |t|
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

  create_table "companies", force: :cascade do |t|
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

  create_table "customers", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "lastname",                      null: false
    t.string   "identification",                null: false
    t.string   "tax_id"
    t.string   "email"
    t.string   "address"
    t.integer  "city_id",                       null: false
    t.integer  "account_id",                    null: false
    t.integer  "lock_version",   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "member",         default: true, null: false
  end

  add_index "customers", ["account_id"], name: "index_customers_on_account_id", using: :btree
  add_index "customers", ["city_id"], name: "index_customers_on_city_id", using: :btree
  add_index "customers", ["identification"], name: "index_customers_on_identification", using: :btree
  add_index "customers", ["lastname"], name: "index_customers_on_lastname", using: :btree
  add_index "customers", ["member"], name: "index_customers_on_member", using: :btree
  add_index "customers", ["name"], name: "index_customers_on_name", using: :btree
  add_index "customers", ["tax_id"], name: "index_customers_on_tax_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",            null: false
    t.integer  "organization_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["name"], name: "index_departments_on_name", using: :btree
  add_index "departments", ["organization_id"], name: "index_departments_on_organization_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "kind",        null: false
    t.date     "joining_at"
    t.integer  "customer_id", null: false
    t.integer  "place_id"
    t.string   "place_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["customer_id"], name: "index_jobs_on_customer_id", using: :btree
  add_index "jobs", ["joining_at"], name: "index_jobs_on_joining_at", using: :btree
  add_index "jobs", ["kind"], name: "index_jobs_on_kind", using: :btree
  add_index "jobs", ["place_type", "place_id"], name: "index_jobs_on_place_type_and_place_id", using: :btree

  create_table "loans", force: :cascade do |t|
    t.string   "status",                                          default: "current", null: false
    t.decimal  "amount",                 precision: 15, scale: 2,                     null: false
    t.integer  "payments_count",                                                      null: false
    t.integer  "progress",                                        default: 0,         null: false
    t.date     "next_payment_expire_at"
    t.date     "expire_at",                                                           null: false
    t.date     "canceled_at"
    t.integer  "job_id",                                                              null: false
    t.integer  "user_id",                                                             null: false
    t.integer  "account_id",                                                          null: false
    t.integer  "lock_version",                                    default: 0,         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loans", ["account_id"], name: "index_loans_on_account_id", using: :btree
  add_index "loans", ["canceled_at"], name: "index_loans_on_canceled_at", using: :btree
  add_index "loans", ["expire_at"], name: "index_loans_on_expire_at", using: :btree
  add_index "loans", ["job_id"], name: "index_loans_on_job_id", using: :btree
  add_index "loans", ["next_payment_expire_at"], name: "index_loans_on_next_payment_expire_at", using: :btree
  add_index "loans", ["progress"], name: "index_loans_on_progress", using: :btree
  add_index "loans", ["status"], name: "index_loans_on_status", using: :btree
  add_index "loans", ["user_id"], name: "index_loans_on_user_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["account_id"], name: "index_organizations_on_account_id", using: :btree
  add_index "organizations", ["name"], name: "index_organizations_on_name", using: :btree

  create_table "payment_taxes", force: :cascade do |t|
    t.integer  "payment_id", null: false
    t.integer  "tax_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_taxes", ["payment_id"], name: "index_payment_taxes_on_payment_id", using: :btree
  add_index "payment_taxes", ["tax_id"], name: "index_payment_taxes_on_tax_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "number",                                            null: false
    t.decimal  "payment",      precision: 15, scale: 2,             null: false
    t.date     "expire_at",                                         null: false
    t.datetime "paid_at"
    t.integer  "loan_id",                                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.integer  "lock_version",                          default: 0, null: false
  end

  add_index "payments", ["account_id"], name: "index_payments_on_account_id", using: :btree
  add_index "payments", ["expire_at"], name: "index_payments_on_expire_at", using: :btree
  add_index "payments", ["loan_id"], name: "index_payments_on_loan_id", using: :btree
  add_index "payments", ["number"], name: "index_payments_on_number", using: :btree
  add_index "payments", ["paid_at"], name: "index_payments_on_paid_at", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "phone",         null: false
    t.integer  "phonable_id"
    t.string   "phonable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["phonable_type", "phonable_id"], name: "index_phones_on_phonable_type_and_phonable_id", using: :btree

  create_table "rate_sets", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rate_sets", ["account_id"], name: "index_rate_sets_on_account_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "payments_count",                          null: false
    t.decimal  "rate",           precision: 15, scale: 5, null: false
    t.integer  "rate_set_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rate_set_id"], name: "index_rates_on_rate_set_id", using: :btree

  create_table "reminders", force: :cascade do |t|
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

  create_table "schedules", force: :cascade do |t|
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
  add_index "schedules", ["schedulable_type", "schedulable_id"], name: "index_schedules_on_schedulable_type_and_schedulable_id", using: :btree
  add_index "schedules", ["scheduled_at"], name: "index_schedules_on_scheduled_at", using: :btree
  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["account_id"], name: "index_states_on_account_id", using: :btree

  create_table "tax_settings", force: :cascade do |t|
    t.string   "name",                                              null: false
    t.decimal  "value",        precision: 15, scale: 2,             null: false
    t.integer  "account_id",                                        null: false
    t.integer  "lock_version",                          default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tax_settings", ["account_id"], name: "index_tax_settings_on_account_id", using: :btree
  add_index "tax_settings", ["name"], name: "index_tax_settings_on_name", using: :btree

  create_table "taxes", force: :cascade do |t|
    t.decimal  "value",          precision: 15, scale: 2,             null: false
    t.integer  "tax_setting_id",                                      null: false
    t.integer  "customer_id",                                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "paid_at"
    t.date     "expire_at",                                           null: false
    t.integer  "account_id",                                          null: false
    t.integer  "lock_version",                            default: 0, null: false
  end

  add_index "taxes", ["account_id"], name: "index_taxes_on_account_id", using: :btree
  add_index "taxes", ["customer_id"], name: "index_taxes_on_customer_id", using: :btree
  add_index "taxes", ["expire_at"], name: "index_taxes_on_expire_at", using: :btree
  add_index "taxes", ["paid_at"], name: "index_taxes_on_paid_at", using: :btree
  add_index "taxes", ["tax_setting_id"], name: "index_taxes_on_tax_setting_id", using: :btree

  create_table "users", force: :cascade do |t|
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

  create_table "versions", force: :cascade do |t|
    t.integer  "item_id",    null: false
    t.string   "item_type",  null: false
    t.integer  "account_id"
    t.string   "event",      null: false
    t.integer  "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["account_id"], name: "index_versions_on_account_id", using: :btree
  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
