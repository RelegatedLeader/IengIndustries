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

ActiveRecord::Schema[8.1].define(version: 2025_01_01_000006) do
  create_table "bookings", force: :cascade do |t|
    t.decimal "actual_fare", precision: 10, scale: 2
    t.datetime "completed_at"
    t.string "confirmation_code"
    t.datetime "created_at", null: false
    t.integer "dropoff_location_id"
    t.decimal "estimated_fare", precision: 10, scale: 2
    t.integer "passenger_count", default: 1
    t.integer "payment_status", default: 0
    t.integer "pickup_location_id"
    t.datetime "scheduled_time"
    t.text "special_requests"
    t.integer "status", default: 0
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "vehicle_id", null: false
    t.index ["confirmation_code"], name: "index_bookings_on_confirmation_code", unique: true
    t.index ["dropoff_location_id"], name: "index_bookings_on_dropoff_location_id"
    t.index ["pickup_location_id"], name: "index_bookings_on_pickup_location_id"
    t.index ["scheduled_time"], name: "index_bookings_on_scheduled_time"
    t.index ["status"], name: "index_bookings_on_status"
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["vehicle_id"], name: "index_bookings_on_vehicle_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.text "description"
    t.decimal "latitude", precision: 10, scale: 6
    t.integer "location_type", default: 0
    t.decimal "longitude", precision: 10, scale: 6
    t.string "name"
    t.string "postal_code"
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude"
    t.index ["name"], name: "index_locations_on_name"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.decimal "distance_km", precision: 10, scale: 2
    t.integer "end_location_id"
    t.integer "estimated_duration_minutes"
    t.string "name"
    t.integer "start_location_id"
    t.integer "status", default: 0
    t.integer "stops_count", default: 0
    t.datetime "updated_at", null: false
    t.integer "vehicle_id", null: false
    t.index ["end_location_id"], name: "index_routes_on_end_location_id"
    t.index ["name"], name: "index_routes_on_name"
    t.index ["start_location_id"], name: "index_routes_on_start_location_id"
    t.index ["vehicle_id"], name: "index_routes_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role", default: 0
    t.datetime "updated_at", null: false
    t.boolean "verified", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "capacity"
    t.string "color"
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "driver_id"
    t.integer "energy_type", default: 0
    t.decimal "hourly_rate", precision: 10, scale: 2
    t.decimal "latitude", precision: 10, scale: 6
    t.string "license_plate"
    t.decimal "longitude", precision: 10, scale: 6
    t.string "name"
    t.integer "status", default: 0
    t.datetime "updated_at", null: false
    t.integer "vehicle_type", null: false
    t.integer "year_manufactured"
    t.index ["driver_id"], name: "index_vehicles_on_driver_id"
    t.index ["license_plate"], name: "index_vehicles_on_license_plate", unique: true
  end

  add_foreign_key "bookings", "locations", column: "dropoff_location_id"
  add_foreign_key "bookings", "locations", column: "pickup_location_id"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "vehicles"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
  add_foreign_key "routes", "locations", column: "end_location_id"
  add_foreign_key "routes", "locations", column: "start_location_id"
  add_foreign_key "routes", "vehicles"
  add_foreign_key "vehicles", "users", column: "driver_id"
end
