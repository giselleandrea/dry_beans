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

ActiveRecord::Schema[7.1].define(version: 2024_04_06_223300) do
  create_table "deliveries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "status_id"
    t.bigint "type_delivery_id"
    t.text "description"
    t.date "date"
    t.string "location"
    t.string "customer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_deliveries_on_status_id"
    t.index ["trip_id"], name: "index_deliveries_on_trip_id"
    t.index ["type_delivery_id"], name: "index_deliveries_on_type_delivery_id"
  end

  create_table "routes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nameRoute"
    t.string "startRoute"
    t.string "endRoute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "route_id"
    t.string "nameTrip"
    t.date "startDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_trips_on_route_id"
  end

  create_table "type_deliveries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "typeDelivery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "deliveries", "statuses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "deliveries", "trips", on_update: :cascade, on_delete: :cascade
  add_foreign_key "deliveries", "type_deliveries", on_update: :cascade, on_delete: :cascade
  add_foreign_key "trips", "routes", on_update: :cascade, on_delete: :cascade
end
