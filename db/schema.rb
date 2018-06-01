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

ActiveRecord::Schema.define(version: 2018_05_31_135408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reports", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.text "preference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.date "date"
    t.string "departing_city"
    t.string "arrival_city"
    t.string "booking_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_on_ticket"
    t.integer "price_cents", default: 0, null: false
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.index ["buyer_id"], name: "index_tickets_on_buyer_id"
    t.index ["seller_id"], name: "index_tickets_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bankaccount"
    t.string "phone"
    t.string "identitycard"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.string "photo"
    t.string "country_code"
    t.string "authy_id"
    t.boolean "verified"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reports", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "tickets", "users", column: "buyer_id"
  add_foreign_key "tickets", "users", column: "seller_id"
end
