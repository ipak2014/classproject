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

ActiveRecord::Schema.define(version: 20140409020124) do

  create_table "properties", force: true do |t|
    t.string   "saver_id"
    t.string   "zpid"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "zestimate"
    t.integer  "valuation_range_high"
    t.integer  "valuation_range_low"
    t.string   "use_code"
    t.integer  "lot_size_square_feet"
    t.integer  "finished_square_feet"
    t.integer  "bathrooms"
    t.integer  "bedrooms"
    t.string   "tax_assessment_year"
    t.integer  "tax_assessment"
    t.integer  "tax_paid"
    t.string   "year_built"
    t.string   "last_sold_date"
    t.integer  "last_sold_price"
    t.string   "zillow_link"
    t.string   "zillow_comps"
    t.string   "zillow_mapz"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "cityzip"
  end

  create_table "questionnaires", force: true do |t|
    t.integer  "income"
    t.text     "cc"
    t.integer  "retirement"
    t.integer  "savings"
    t.integer  "mortgage"
    t.integer  "downpayment"
    t.text     "ready"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "savers", force: true do |t|
    t.integer  "income"
    t.string   "cc"
    t.integer  "retirement"
    t.integer  "savings"
    t.integer  "mortgage"
    t.integer  "downpayment"
    t.string   "ready"
    t.integer  "zip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "serviceareas", force: true do |t|
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
