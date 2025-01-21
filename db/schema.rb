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

ActiveRecord::Schema[7.1].define(version: 2024_07_22_084603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.decimal "price_per_sqm_livable"
    t.decimal "price_per_sqm_land"
    t.decimal "price_per_sqm_rental"
    t.string "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.string "advisory_need"
    t.string "project_timing"
    t.integer "financing_need"
    t.integer "financial_investment"
    t.bigint "simulation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["simulation_id"], name: "index_leads_on_simulation_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "nb_dwelling"
    t.float "area_sqm_land"
    t.float "area_sqm_livable"
    t.float "floor_area_ratio"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_name"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.integer "street_number"
    t.string "street_name"
    t.integer "zipcode"
    t.integer "nb_dwelling"
    t.decimal "area_sqm_land"
    t.decimal "area_sqm_livable"
    t.decimal "floor_area_ratio"
    t.integer "year_construction"
    t.string "building_zone"
    t.string "density_area"
    t.integer "building_height_floors"
    t.integer "nb_rooms_per_dwelling"
    t.string "energy_class"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id"
    t.index ["city_id"], name: "index_properties_on_city_id"
    t.index ["project_id"], name: "index_properties_on_project_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "regulations", force: :cascade do |t|
    t.string "city_name"
    t.decimal "floor_area_ratio"
    t.integer "building_height"
    t.integer "housing_social"
    t.integer "housing_affordable"
    t.integer "housing_market_rate"
    t.string "url"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_regulations_on_city_id"
  end

  create_table "simulations", force: :cascade do |t|
    t.integer "nb_dwelling"
    t.decimal "price_total_livable"
    t.integer "price_total_land"
    t.integer "price_total_rental"
    t.decimal "cost_destruction"
    t.decimal "area_sqm_land"
    t.decimal "floor_area_ratio"
    t.decimal "area_sqm_construction"
    t.decimal "area_sqm_livable"
    t.integer "area_sqm_common"
    t.integer "building_height_floors"
    t.integer "nb_rooms_per_dwelling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id", null: false
    t.index ["project_id"], name: "index_simulations_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "marital_status"
    t.string "ownership_status"
    t.string "postal_address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "leads", "simulations"
  add_foreign_key "projects", "users"
  add_foreign_key "properties", "cities"
  add_foreign_key "properties", "projects"
  add_foreign_key "properties", "users"
  add_foreign_key "regulations", "cities"
  add_foreign_key "simulations", "projects"
end
