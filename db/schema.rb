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

ActiveRecord::Schema[7.0].define(version: 2022_12_15_195502) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blocks", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "centers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.time "start_time"
    t.bigint "center_id", null: false
    t.integer "max_attendees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "end_time"
    t.integer "week_day"
    t.index ["center_id"], name: "index_courses_on_center_id"
  end

  create_table "coworkings", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_coworkings_on_center_id"
  end

  create_table "loisirs", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_loisirs_on_center_id"
  end

  create_table "order_courses", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.string "charge_id"
    t.index ["course_id"], name: "index_order_courses_on_course_id"
    t.index ["user_id"], name: "index_order_courses_on_user_id"
  end

  create_table "order_subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subscription_id", null: false
    t.string "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_order_subscriptions_on_subscription_id"
    t.index ["user_id"], name: "index_order_subscriptions_on_user_id"
  end

  create_table "relaxations", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_relaxations_on_center_id"
  end

  create_table "restaurations", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_restaurations_on_center_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "duration"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "birth_date"
    t.boolean "is_admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "center_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_users_on_center_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "courses", "centers"
  add_foreign_key "coworkings", "centers"
  add_foreign_key "loisirs", "centers"
  add_foreign_key "order_courses", "courses"
  add_foreign_key "order_courses", "users"
  add_foreign_key "order_subscriptions", "subscriptions"
  add_foreign_key "order_subscriptions", "users"
  add_foreign_key "relaxations", "centers"
  add_foreign_key "restaurations", "centers"
  add_foreign_key "users", "centers"
end
