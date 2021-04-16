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

ActiveRecord::Schema.define(version: 2021_04_16_171756) do

  create_sequence "action_text_rich_texts_id_seq"
  create_sequence "action_text_rich_texts_id_seq1"
  create_sequence "active_storage_attachments_id_seq"
  create_sequence "active_storage_attachments_id_seq1"
  create_sequence "active_storage_blobs_id_seq"
  create_sequence "active_storage_blobs_id_seq1"
  create_sequence "active_storage_variant_records_id_seq"
  create_sequence "active_storage_variant_records_id_seq1"
  create_sequence "brands_id_seq"
  create_sequence "brands_id_seq1"
  create_sequence "locations_id_seq"
  create_sequence "product_option_value_variants_id_seq"
  create_sequence "product_option_values_id_seq"
  create_sequence "product_options_id_seq"
  create_sequence "product_variant_inventories_id_seq"
  create_sequence "product_variants_id_seq"
  create_sequence "products_id_seq"
  create_sequence "products_id_seq1"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_enum :product_status, [
    "drafted",
    "published",
    "archived",
  ], force: :cascade

  create_enum :product_type, [
    "standard",
    "gift_card",
  ], force: :cascade

  create_enum :product_variant_type, [
    "physical",
    "digital",
  ], force: :cascade

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.integer "position", default: 0
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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.boolean "inventory"
    t.boolean "local_pickup"
    t.boolean "default"
    t.integer "fulfillment_priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_option_value_variants", force: :cascade do |t|
    t.bigint "product_option_value_id", null: false
    t.bigint "product_variant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_option_value_id"], name: "index_product_option_value_variants_on_product_option_value_id"
    t.index ["product_variant_id"], name: "index_product_option_value_variants_on_product_variant_id"
  end

  create_table "product_option_values", force: :cascade do |t|
    t.bigint "product_option_id", null: false
    t.string "value"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_option_id"], name: "index_product_option_values_on_product_option_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "name"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "product_variant_inventories", force: :cascade do |t|
    t.bigint "product_variant_id", null: false
    t.bigint "location_id", null: false
    t.bigint "quantity_on_hand", default: 0, null: false
    t.bigint "quantity_reserved", default: 0, null: false
    t.integer "low_inventory_threshold", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_product_variant_inventories_on_location_id"
    t.index ["product_variant_id"], name: "index_product_variant_inventories_on_product_variant_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.enum "variant_type", default: "physical", null: false, enum_name: "product_variant_type"
    t.string "title"
    t.string "subtitle"
    t.string "sku"
    t.boolean "master"
    t.text "search_tags", default: [], array: true
    t.text "care_tags", default: [], array: true
    t.boolean "visible_on_storefront", default: true
    t.boolean "track_inventory", default: true
    t.boolean "backorderable", default: true
    t.boolean "giftable", default: true
    t.jsonb "data", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "brand_id"
    t.enum "product_type", default: "standard", null: false, enum_name: "product_type"
    t.enum "status", default: "drafted", null: false, enum_name: "product_status"
    t.jsonb "data", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "product_option_value_variants", "product_option_values"
  add_foreign_key "product_option_value_variants", "product_variants"
  add_foreign_key "product_option_values", "product_options"
  add_foreign_key "product_options", "products"
  add_foreign_key "product_variant_inventories", "locations"
  add_foreign_key "product_variant_inventories", "product_variants"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "brands"
end
