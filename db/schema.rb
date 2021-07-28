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

ActiveRecord::Schema.define(version: 2021_07_18_203916) do

  create_sequence "action_text_rich_texts_id_seq"
  create_sequence "active_storage_attachments_id_seq"
  create_sequence "active_storage_blobs_id_seq"
  create_sequence "active_storage_variant_records_id_seq"
  create_sequence "brands_id_seq"
  create_sequence "collection_items_id_seq"
  create_sequence "collections_id_seq"
  create_sequence "customer_prices_id_seq"
  create_sequence "events_id_seq"
  create_sequence "locations_id_seq"
  create_sequence "navigation_menu_items_id_seq"
  create_sequence "product_inventories_id_seq"
  create_sequence "product_option_value_variants_id_seq"
  create_sequence "product_option_values_id_seq"
  create_sequence "product_options_id_seq"
  create_sequence "product_variant_inventories_id_seq"
  create_sequence "product_variant_personalization_field_values_id_seq"
  create_sequence "product_variant_personalization_fields_id_seq"
  create_sequence "product_variants_id_seq"
  create_sequence "products_id_seq"
  create_sequence "seo_listings_id_seq"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_enum :collection_status, [
    "drafted",
    "published",
    "archived",
  ], force: :cascade

  create_enum :collection_type, [
    "manual",
    "automated",
  ], force: :cascade

  create_enum :field_type, [
    "text_field",
    "text_area",
    "number_field",
    "date_field",
    "file_field",
    "select_field",
    "multi_select_field",
  ], force: :cascade

  create_enum :price_type, [
    "basic",
    "volume",
    "tiered",
  ], force: :cascade

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

  create_enum :unit_of_measure, [
    "pcs",
    "g",
    "kg",
    "oz",
    "lb",
    "ml",
    "l",
    "cm",
    "m",
    "cm2",
    "m2",
  ], force: :cascade

  create_enum :weight_unit_of_measure, [
    "g",
    "kg",
    "lb",
    "oz",
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
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collection_items", force: :cascade do |t|
    t.bigint "collection_itemable_id"
    t.string "collection_itemable_type"
    t.bigint "collection_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_collection_items_on_collection_id"
    t.index ["collection_itemable_id", "collection_itemable_type"], name: "index_collection_items_on_itemable_id_and_itemable_type"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name", null: false
    t.enum "status", default: "drafted", null: false, enum_name: "collection_status"
    t.enum "collection_type", default: "manual", null: false, enum_name: "collection_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_prices", force: :cascade do |t|
    t.bigint "customer_priceable_id"
    t.string "customer_priceable_type"
    t.enum "price_type", default: "basic", null: false, enum_name: "price_type"
    t.integer "minimum_quantity", default: 1, null: false
    t.integer "increment_quantity", default: 1, null: false
    t.boolean "default", default: true
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "KES", null: false
    t.integer "compare_at_price_cents", default: 0, null: false
    t.string "display_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_priceable_id", "customer_priceable_type"], name: "index_customer_prices_on_priceable_id_and_priceable_type"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "eventable_id"
    t.string "eventable_type"
    t.bigint "creator_id"
    t.string "creator_type"
    t.string "name"
    t.jsonb "data"
    t.jsonb "request_details"
    t.jsonb "metadata"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id", "creator_type"], name: "index_events_on_creator_id_and_creator_type"
    t.index ["eventable_id", "eventable_type"], name: "index_events_on_eventable_id_and_eventable_type"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "inventory", default: true, null: false
    t.boolean "local_pickup", default: false, null: false
    t.boolean "default", null: false
    t.integer "fulfillment_priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "navigation_menu_items", force: :cascade do |t|
    t.bigint "navigation_menu_itemable_id"
    t.string "navigation_menu_itemable_type"
    t.string "name", null: false
    t.text "path", null: false
    t.text "url"
    t.integer "sibling_position", default: 0, null: false
    t.boolean "visible", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["navigation_menu_itemable_id", "navigation_menu_itemable_type"], name: "index_menu_items_on_menu_itemable_id_and_menu_itemable_type"
  end

  create_table "product_inventories", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.enum "unit", default: "pcs", null: false, enum_name: "unit_of_measure"
    t.float "quantity_on_hand", default: 0.0, null: false
    t.float "quantity_reserved", default: 0.0, null: false
    t.float "low_stock_threshold", default: 0.0, null: false
    t.date "expires_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_product_inventories_on_location_id"
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
    t.string "value", null: false
    t.integer "position", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_option_id"], name: "index_product_option_values_on_product_option_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "position", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "product_variant_inventories", force: :cascade do |t|
    t.bigint "product_variant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_inventory_id", null: false
    t.index ["product_inventory_id"], name: "index_product_variant_inventories_on_product_inventory_id"
    t.index ["product_variant_id"], name: "index_product_variant_inventories_on_product_variant_id"
  end

  create_table "product_variant_personalization_field_values", force: :cascade do |t|
    t.bigint "product_variant_personalization_field_id", null: false
    t.jsonb "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_variant_personalization_field_id"], name: "idx_variant_personalization_field_values_personalization_field"
  end

  create_table "product_variant_personalization_fields", force: :cascade do |t|
    t.bigint "product_variant_id", null: false
    t.string "label", null: false
    t.text "help_text"
    t.string "placeholder"
    t.text "options", default: [], array: true
    t.boolean "required", default: true, null: false
    t.integer "position", default: 0, null: false
    t.enum "field_type", default: "text_field", null: false, enum_name: "field_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_variant_id"], name: "idx_variant_personalization_fields_on_variant_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.enum "variant_type", default: "physical", null: false, enum_name: "product_variant_type"
    t.string "title", null: false
    t.string "subtitle"
    t.string "sku", null: false
    t.boolean "master", null: false
    t.text "search_tags", default: [], array: true
    t.text "care_tags", default: [], array: true
    t.boolean "visible_on_storefront", default: true
    t.boolean "track_inventory", default: true
    t.boolean "backorderable", default: true
    t.boolean "giftable", default: true
    t.float "weight"
    t.enum "weight_unit", enum_name: "weight_unit_of_measure"
    t.jsonb "data", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "inventory_multiplier", default: 1.0, null: false
    t.enum "inventory_multiplier_unit", default: "pcs", null: false, enum_name: "unit_of_measure"
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

  create_table "seo_listings", force: :cascade do |t|
    t.bigint "seo_listable_id"
    t.string "seo_listable_type"
    t.string "meta_title", null: false
    t.text "meta_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seo_listable_id", "seo_listable_type"], name: "index_seo_listings_on_seo_listable_id_and_seo_listable_type"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "collection_items", "collections"
  add_foreign_key "product_inventories", "locations"
  add_foreign_key "product_option_value_variants", "product_option_values"
  add_foreign_key "product_option_value_variants", "product_variants"
  add_foreign_key "product_option_values", "product_options"
  add_foreign_key "product_options", "products"
  add_foreign_key "product_variant_inventories", "product_inventories"
  add_foreign_key "product_variant_inventories", "product_variants"
  add_foreign_key "product_variant_personalization_field_values", "product_variant_personalization_fields"
  add_foreign_key "product_variant_personalization_fields", "product_variants"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "brands"
end
