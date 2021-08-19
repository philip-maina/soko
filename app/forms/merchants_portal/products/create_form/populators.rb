class MerchantsPortal::Products::CreateForm
  module Populators
    class Brand
      # brand is optional
      def self.populate(attrs)
        return nil unless attrs.present?
        ::Brand.new(attrs)
      end
    end
    
    class Product
      def self.populate(brand, attrs)
        ::Product.new(brand: brand, product_type: attrs[:product_type])
      end
    end

    class Product::Inventories
      def self.populate(product, attrs)
        attrs.map do |product_inventory_attrs| 
          ::Product::Inventory.new(product_inventory_attrs)
        end
      end
    end

    class Product::Options
      # product options are optional
      def self.populate(product, attrs)
        options, option_values = [], []

        attrs.each do |option_attrs|
          option = ::Product::Option.new(
            product: product,
            name: option_attrs[:name],
            description: option_attrs[:description],
            position: option_attrs[:position]
          )
          options.push(option)
          option_values.concat(Product::OptionValues.populate(option, option_attrs[:product_option_values]))
        end

        return [options, option_values]
      end
    end

    class Product::OptionValues
      def self.populate(option, attrs)
        attrs.map do |option_value_attrs|
          ::Product::OptionValue.new(option_value_attrs.merge(option: option))
        end
      end
    end

    class Product::Variants
      # There will be at least one variant - master AND and its seo_listing, 
      # However product_variant_inventories, product_option_value_variants, customer_prices, personalization_fields are optional 
      def self.populate(product, inventories, option_values, attrs)
        variants,
        option_value_variants,
        variant_inventories,
        customer_prices, 
        personalization_fields,
        seo_listings = [], [], [], [], [], []

        attrs.each do |variant_attrs|
          variant = Product::Variant.populate(product, variant_attrs)
          variants.push(variant)

          seo_listings.push(Seo::Listing.populate(variant, variant_attrs[:seo_listing]))

          option_value_variants.concat(
            Product::OptionValueVariants.populate(
              variant,
              option_values,
              variant_attrs[:product_option_value_variants]
            )
          ) if variant_attrs[:product_option_value_variants].present?

          variant_inventories.concat(
            Product::VariantInventories.populate(
              variant,
              inventories,
              variant_attrs[:product_variant_inventories]
            )
          ) if variant_attrs[:product_variant_inventories].present?

          customer_prices.concat(
            Customer::Prices.populate(
              variant,
              variant_attrs[:customer_prices]
            )
          ) if variant_attrs[:customer_prices].present?

          personalization_fields.concat(
            Product::Variant::PersonalizationFields.populate(
              variant,
              variant_attrs[:product_variant_personalization_fields]
            )
          ) if variant_attrs[:product_variant_personalization_fields].present?
        end

        return [
          variants,
          option_value_variants,
          variant_inventories,
          customer_prices, 
          personalization_fields,
          seo_listings
        ]
      end
    end

    class Product::Variant
      def self.populate(product, attrs)
        ::Product::Variant.new(
          product: product,
          variant_type: attrs[:variant_type],
          master: attrs[:master],
          title: attrs[:title],
          subtitle: attrs[:subtitle],
          description: attrs[:description],
          sku: attrs[:sku],
          care_tags: attrs[:care_tags],
          search_tags: attrs[:search_tags],
          images: attrs[:images],
          downloads: attrs[:downloads],
          track_inventory: attrs[:track_inventory],
          backorderable: attrs[:backorderable],
          visible_on_storefront: attrs[:visible_on_storefront],
          giftable: attrs[:giftable],
          weight: attrs[:weight],
          weight_unit: attrs[:weight_unit],
          inventory_multiplier: attrs[:inventory_multiplier],
          inventory_multiplier_unit: attrs[:inventory_multiplier_unit]
        )
      end
    end

    class Product::OptionValueVariants
      def self.populate(variant, option_values, attrs)
        attrs.map do |option_value_variant_attrs|
          option_value = find_option_value(option_values, option_value_variant_attrs)
          ::Product::OptionValueVariant.new(variant: variant, option_value: option_value)
        end
      end

      def self.find_option_value(option_values, option_value_variant_attrs)
        option_values.find do |option_value|
          option_value.temporary_id == option_value_variant_attrs[:product_option_value_id]
        end
      end
    end

    class Product::VariantInventories
      def self.populate(variant, inventories, attrs)
        attrs.map do |variant_inventory_attrs|
          inventory = find_inventory(inventories, variant_inventory_attrs)
          ::Product::VariantInventory.new(variant: variant, inventory: inventory)
        end
      end

      def self.find_inventory(inventories, variant_inventory_attrs)
        inventories.find do |inventory|
          inventory.temporary_id == variant_inventory_attrs[:product_inventory_id]
        end
      end
    end

    class Product::Variant::PersonalizationFields
      def self.populate(variant, attrs)
        attrs.map do |personalization_field_attrs| 
          ::Product::Variant::PersonalizationField.new(
            personalization_field_attrs.merge(variant: variant)
          )
        end
      end
    end


    module Customer
      class Prices
        def self.populate(variant, attrs)
          attrs.map do |customer_price_attrs|
            ::Customer::Price.new(customer_price_attrs.merge(customer_priceable: variant)) 
          end
        end
      end
    end
    
    module Collection
      class Items
        def self.populate(product, attrs)
          attrs.map do |collection_item_attrs|
            ::Collection::Item.new(collection_item_attrs.merge(collection_itemable: product))
          end
        end
      end
    end

    module Seo
      class Listing
        def self.populate(variant, attrs)
          ::Seo::Listing.new(attrs.merge(seo_listable: variant))
        end
      end
    end
  end
end