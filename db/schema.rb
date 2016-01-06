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

ActiveRecord::Schema.define(version: 20160106113122) do

  create_table "car_models", force: true do |t|
    t.string   "name"
    t.string   "model_slug"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "car_models", ["organization_id"], name: "index_car_models_on_organization_id"

  create_table "model_types", force: true do |t|
    t.string   "name"
    t.string   "model_type_slug"
    t.string   "model_type_code"
    t.integer  "base_price"
    t.integer  "car_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "model_types", ["car_model_id"], name: "index_model_types_on_car_model_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "public_name"
    t.string   "org_type"
    t.string   "pricing_policy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "auth_token"
    t.boolean  "admin"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id"

end
