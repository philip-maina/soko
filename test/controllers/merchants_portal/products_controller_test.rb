require "test_helper"

class MerchantsPortal::ProductsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @location = create(:location, name: "Main Warehouse (Muhoho Ave.)")
  end

  def params_with_master_and_non_master_variants
    {
      product: {
        product_type: "standard",
        brand: { name: "Zucchini Greengrocers" },
        collection_items: [],
        product_options: [
          {
            name: "Bulb Size",
            description: "View all available Onion Bulb Sizes",
            position: 0,
            product_option_values: [
              {
                temporary_id: 1,
                value: "Small",
                position: 0
              },
              {
                temporary_id: 2,
                value: "Medium",
                position: 1
              },
              {
                temporary_id: 3,
                value: "Large",
                position: 2
              },
              {
                temporary_id: 4,
                value: "Mixed (Small & Medium)",
                position: 3
              }
            ]
          },
          {
            name: "Pack Size",
            description: "",
            position: 1,
            product_option_values: [
              {
                temporary_id: 5,
                value: "3 pcs (approx. 150g)",
                position: 0
              },
              {
                temporary_id: 6,
                value: "7 pcs (approx. 310g)",
                position: 1
              },
              {
                temporary_id: 7,
                value: "10kg crate",
                position: 2
              },
              {
                temporary_id: 8,
                value: "20kg sack",
                position: 3
              }
            ]
          }
        ],
        product_inventories: [
          {
            temporary_id: 1,
            quantity_on_hand: 0,
            low_inventory_threshold: 0,
            location_id: @location.id,
            unit: "kg",
            expires_on: nil
          },
          { 
            temporary_id: 2,
            quantity_on_hand: 580.55,
            low_inventory_threshold: 42.45, 
            location_id: @location.id,
            unit: "kg",
            expires_on: nil
          }
        ],
        product_variants: [
          {
            variant_type: "physical",
            master: "true",
            title: "Organic Red Creole Onions",
            subtitle: "",
            description: "Red onions are cultivars of the onion with purplish-red skin and white flesh tinged with red. They are most commonly used in the culinary arts, but the skin of the red onion has also been used as a dye. These onions tend to be medium to large in size and have a sharp flavor and eye-watering qualities.",
            sku: "PROD-0000001",
            care_tags: ["Store in a cool dark dry room", "Once cut, they should be refrigerated"],
            search_tags: ["onion", "red", "creole", "bulb", "vegetable", "organic"],
            images: [],
            downloads: [],
            track_inventory: "true",
            backorderable: "true",
            visible_on_storefront: "true",
            giftable: "true",
            weight: 1,
            weight_unit: "g",
            inventory_multiplier: 1,
            inventory_multiplier_unit: "g",
            product_option_value_variants: [],
            product_variant_inventories: [{ product_inventory_id: 1 }],
            customer_prices: [
              { 
                price_type: "basic", 
                minimum_quantity: 1, 
                increment_quantity: 1, 
                price: 0, 
                price_currency: "KES",
                compare_at_price: 0,
                display_price: "",
                default: "true"
              }
            ],
            product_variant_personalization_fields: [
              {
                label: "Pick a Delivery Date",
                help_text: "When should the order should be delivered to your doorstep/pickup location ?",
                placeholder: "",
                options: [],
                required: "true",
                position: 0,
                field_type: "date_field"
              }
            ],
            seo_listing: {
              meta_title: "Organic Red Creole Onions",
              meta_description: ""
            }
          },
          {
            variant_type: "physical",
            master: "false",
            title: "Organic Red Creole Onions",
            subtitle: "Small (3 pcs for Ksh 20)",
            description: "Red onions are cultivars of the onion with purplish-red skin and white flesh tinged with red. They are most commonly used in the culinary arts, but the skin of the red onion has also been used as a dye. These onions tend to be medium to large in size and have a sharp flavor and eye-watering qualities.",
            sku: "PROD-0000002",
            care_tags: ["Store in a cool dark dry room", "Once cut, they should be refrigerated"],
            search_tags: ["onion", "red", "creole", "bulb", "vegetable", "organic", "small"],
            images: [],
            downloads: [],
            track_inventory: "true",
            backorderable: "true",
            visible_on_storefront: "true",
            giftable: "true",
            weight: 150,
            weight_unit: "g",
            inventory_multiplier: 150,
            inventory_multiplier_unit: "g",
            product_option_value_variants: [
              { product_option_value_id: 1 },
              { product_option_value_id: 5 }
            ],
            product_variant_inventories: [{ product_inventory_id: 2 }],
            customer_prices: [
              { 
                price_type: "basic", 
                minimum_quantity: 1, 
                increment_quantity: 1, 
                price: 20, 
                price_currency: "KES",
                compare_at_price: 20,
                display_price: "KSh 20",
                default: "true"
              }
            ],
            product_variant_personalization_fields: [
              {
                label: "Pick a Delivery Date",
                help_text: "When should the order should be delivered to your doorstep/pickup location ?",
                placeholder: "",
                options: [],
                required: "true",
                position: 0,
                field_type: "date_field"
              }
            ],
            seo_listing: {
              meta_title: "Organic Red Creole Onions (Small | 3 for KSh 20)",
              meta_description: ""
            }
          },
          {
            variant_type: "physical",
            master: "false",
            title: "Organic Red Creole Onions",
            subtitle: "Small (7 for Ksh 32)",
            description: "Red onions are cultivars of the onion with purplish-red skin and white flesh tinged with red. They are most commonly used in the culinary arts, but the skin of the red onion has also been used as a dye. These onions tend to be medium to large in size and have a sharp flavor and eye-watering qualities.",
            sku: "PROD-0000003",
            care_tags: ["Store in a cool dark dry room", "Once cut, they should be refrigerated"],
            search_tags: ["onion", "red", "creole", "bulb", "vegetable", "organic", "small"],
            images: [],
            downloads: [],
            track_inventory: "true",
            backorderable: "true",
            visible_on_storefront: "true",
            giftable: "true",
            weight: 310,
            weight_unit: "g",
            inventory_multiplier: 310,
            inventory_multiplier_unit: "g",
            product_option_value_variants: [
              { product_option_value_id: 1 },
              { product_option_value_id: 6 }
            ],
            product_variant_inventories: [{ product_inventory_id: 2 }],
            customer_prices: [
              { 
                price_type: "basic", 
                minimum_quantity: 1, 
                increment_quantity: 1, 
                price: 32, 
                price_currency: "KES",
                compare_at_price: 32,
                display_price: "KSh 32",
                default: "true"
              }
            ],
            product_variant_personalization_fields: [
              {
                label: "Pick a Delivery Date",
                help_text: "When should the order should be delivered to your doorstep/pickup location ?",
                placeholder: "",
                options: [],
                required: "true",
                position: 0,
                field_type: "date_field"
              }
            ],
            seo_listing: {
              meta_title: "Organic Red Creole Onions (Small | 7 for KSh 32)",
              meta_description: ""
            }
          },
          {
            variant_type: "physical",
            master: "false",
            title: "Organic Red Creole Onions",
            subtitle: "Small (10kg crate)",
            description: "Red onions are cultivars of the onion with purplish-red skin and white flesh tinged with red. They are most commonly used in the culinary arts, but the skin of the red onion has also been used as a dye. These onions tend to be medium to large in size and have a sharp flavor and eye-watering qualities.",
            sku: "PROD-0000004",
            care_tags: ["Store in a cool dark dry room", "Once cut, they should be refrigerated"],
            search_tags: ["onion", "red", "creole", "bulb", "vegetable", "organic", "small", "crate"],
            images: [],
            downloads: [],
            track_inventory: "true",
            backorderable: "true",
            visible_on_storefront: "true",
            giftable: "true",
            weight: 10.5,
            weight_unit: "kg",
            inventory_multiplier: 10,
            inventory_multiplier_unit: "kg",
            product_option_value_variants: [
              { product_option_value_id: 1 },
              { product_option_value_id: 7 }
            ],
            product_variant_inventories: [{ product_inventory_id: 2 }],
            customer_prices: [
              { 
                price_type: "basic", 
                minimum_quantity: 1, 
                increment_quantity: 1, 
                price: 8500, 
                price_currency: "KES",
                compare_at_price: 8500,
                display_price: "KSh 8500",
                default: "true"
              }
            ],
            product_variant_personalization_fields: [
              {
                label: "Pick a Delivery Date",
                help_text: "When should the order should be delivered to your doorstep/pickup location ?",
                placeholder: "",
                options: [],
                required: "true",
                position: 0,
                field_type: "date_field"
              }
            ],
            seo_listing: {
              meta_title: "Organic Red Creole Onions (Small | 10kg crate)",
              meta_description: ""
            }
          }
        ]
      }
    }
  end

  def params_with_master_variant
    {
      product: {
        product_type: "standard",
        brand: { name: "Zucchini Greengrocers" },
        collection_items: [],
        product_options: [],
        product_inventories: [
          { 
            temporary_id: 1,
            quantity_on_hand: 580.55,
            low_inventory_threshold: 42.45, 
            location_id: @location.id,
            unit: "kg",
            expires_on: nil
          }
        ],
        product_variants: [
          {
            variant_type: "physical",
            master: "true",
            title: "Organic Red Creole Onions",
            subtitle: "",
            description: "Red onions are cultivars of the onion with purplish-red skin and white flesh tinged with red. They are most commonly used in the culinary arts, but the skin of the red onion has also been used as a dye. These onions tend to be medium to large in size and have a sharp flavor and eye-watering qualities.",
            sku: "PROD-0000001",
            care_tags: ["Store in a cool dark dry room", "Once cut, they should be refrigerated"],
            search_tags: ["onion", "red", "creole", "bulb", "vegetable", "organic"],
            images: [],
            downloads: [],
            track_inventory: "true",
            backorderable: "true",
            visible_on_storefront: "true",
            giftable: "true",
            weight: 310,
            weight_unit: "g",
            inventory_multiplier: 310,
            inventory_multiplier_unit: "g",
            product_option_value_variants: [],
            product_variant_inventories: [{ product_inventory_id: 1 }],
            customer_prices: [
              { 
                price_type: "basic", 
                minimum_quantity: 1, 
                increment_quantity: 1, 
                price: 32, 
                price_currency: "KES",
                compare_at_price: 32,
                display_price: "",
                default: "true"
              }
            ],
            product_variant_personalization_fields: [
              {
                label: "Pick a Delivery Date",
                help_text: "When should the order should be delivered to your doorstep/pickup location ?",
                placeholder: "",
                options: [],
                required: "true",
                position: 0,
                field_type: "date_field"
              }
            ],
            seo_listing: {
              meta_title: "Organic Red Creole Onions",
              meta_description: ""
            }
          }
        ]
      }
    }
  end



  test "should create a product containing physical variants (master & non-master)" do
    assert_difference(
      -> { Brand.count }   => 1,
      -> { Product.count } => 1,

      -> { Product::Option.count }    => 2,
      -> { Product::Inventory.count } => 2,

      -> { Seo::Listing.count }                           => 4,
      -> { Customer::Price.count }                        => 4,
      -> { Product::Variant.count }                       => 4,
      -> { Product::VariantInventory.count }              => 4,
      -> { Product::Variant::PersonalizationField.count } => 4,

      -> { Product::OptionValueVariant.count } => 6,

      -> { Product::OptionValue.count } => 8
    ) do
      post(
        merchants_portal_products_url(format: :json), 
        params: { merchants_portal_products_create_form: params_with_master_and_non_master_variants }
      )
    end

    # assert Product.last.published?
  end

  test "should create a product containing only a physical master variant" do
    assert_difference(
      [
        'Brand.count',
        'Product.count', 
        'Product::Inventory.count',
        'Seo::Listing.count',
        'Customer::Price.count',
        'Product::Variant.count',
        'Product::VariantInventory.count',
        'Product::Variant::PersonalizationField.count'
      ], 1
    ) do
      post(
        merchants_portal_products_url(format: :json), 
        params: { merchants_portal_products_create_form: params_with_master_variant }
      )
    end
  end

  # Book store example:
  #   • Signed books share inventory with Hard-cover books
  test "should create a product containing both physical and digital variants" do
  end
end
