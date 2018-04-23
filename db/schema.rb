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

ActiveRecord::Schema.define(version: 2018_04_23_030739) do

  create_table "annual_budgets", force: :cascade do |t|
    t.text "name"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.date "withdrawal_data"
    t.integer "amount"
    t.text "name"
    t.boolean "recurring"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.text "source"
    t.date "pay_date"
    t.integer "gross_amount"
    t.date "start_date"
    t.date "end_date"
    t.boolean "recurring"
    t.integer "federal_tax"
    t.integer "state_tax"
    t.integer "social_sec_tax"
    t.integer "medicare_tax"
    t.integer "net_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "savings", force: :cascade do |t|
    t.text "type"
    t.integer "amount"
    t.text "name"
    t.boolean "recurring"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
