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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130613211858) do

  create_table "companies", :force => true do |t|
    t.string  "name"
    t.string  "perma"
    t.integer "industry_id"
  end

  add_index "companies", ["industry_id"], :name => "industry_id_ix"

  create_table "financials", :force => true do |t|
    t.string "name"
    t.string "perma"
  end

  create_table "fundings", :force => true do |t|
    t.integer "company_id"
    t.string  "funding_code"
    t.float   "funding_amount"
    t.string  "funding_currency"
    t.date    "funding_date"
  end

  add_index "fundings", ["company_id"], :name => "company_id_ix"

  create_table "individuals", :force => true do |t|
    t.string "name"
    t.string "perma"
  end

  create_table "industries", :force => true do |t|
    t.string "name"
  end

  create_table "investments", :force => true do |t|
    t.integer  "funding_id"
    t.integer  "investable_id"
    t.string   "investable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "investments", ["funding_id"], :name => "funding_id_ix"
  add_index "investments", ["investable_id", "investable_type"], :name => "index_investments_on_investable_id_and_investable_type"

  create_table "locations", :force => true do |t|
    t.integer "company_id"
    t.string  "address1"
    t.string  "address2"
    t.string  "zipcode"
    t.string  "city"
    t.string  "statecode"
    t.string  "countrycode"
    t.float   "latitude"
    t.float   "longitude"
  end

  add_index "locations", ["company_id"], :name => "index_locations_on_company_id"

end
