class MerchantsPortal::Products::CreateForm
  module Populators
    class Brand
      # brand is optional
      def self.populate(attrs)
        return nil unless attrs.present?
        Brand.new(attrs)
      end
    end
    
    class Product
      def self.populate(brand, attrs)
        Product.new(brand: brand, product_type: attrs[:product_type])
      end
    end

    class Collection::Items
      def self.populate(product, attrs)
        attrs.map { |collection_item_attrs| product.collection_items.new(collection_item_attrs) }
      end
    end

    class Product::Options
      # product options are optional
      def self.populate(product, attrs)
        options, 
        option_values = [], []

        attrs.each do |option_attrs|
          option = product.options.new(option_attrs.slice(:name, :description, :position))
          options.push(option)
          option_values.concat(Product::OptionValues.populate(option, option_attrs[:product_option_values]))
        end

        return [options, option_values]
      end
    end

    class Product::OptionValues
      def self.populate(option, attrs)
        attrs.map do |option_value_attrs|
          option_value = option.option_values.new(option_value_attrs.slice(:value, :position))
          option_value.temporary_id = option_value_attrs[:temporary_id]
          option_value
        end
      end
    end

    class Product::Variants
      # There will be at least one variant - master AND and its seo_listing, 
      # However product_variant_inventories, product_option_value_variants, customer_prices, personalization_fields are optional 
      def self.populate(product, option_values, attrs)
        variants,
        option_value_variants,
        inventories,
        customer_prices, 
        personalization_fields,
        seo_listings = [], [], [], [], []

        attrs.each do |variant_attrs|
          variant = Product::Variant.populate(product, attrs)
          variants.push(variant)
          
          seo_listings.push(Product::Seo::Listing.populate(variant, variant_attrs[:seo_listing]))

          option_value_variants.concat(
            Product::OptionValueVariants.populate(
              variant,
              option_values,
              variant_attrs[:product_option_value_variants]
            )
          ) if variant_attrs[:product_option_value_variants].present?

          inventories.concat(
            Product::Variant::Inventories.populate(
              variant,
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
          inventories,
          customer_prices, 
          personalization_fields,
          seo_listings
        ]
      end
    end

    class Product::Variant
      def self.populate(product, attrs)
        product.variants.new(
          attrs.slice(
            :variant_type,
            :master,
            :title,
            :subtitle,
            :description,
            :sku,
            :care_tags,
            :search_tags,
            :images,
            :downloads,
            :track_inventory,
            :backorderable,
            :visible_on_storefront,
            :giftable,
            :weight,
            :weight_unit
          )
        )
      end
    end

    class Product::OptionValueVariants
      def self.populate(variant, option_values, attrs)
        attrs.map do |option_value_variant_attrs|
          option_value = find_option_value(option_values, option_value_variant_attrs)
          variant.option_value_variants.new(product_option_value: option_value)
        end
      end

      def self.find_option_value(option_values)
        option_values.find do |option_value|
          option_value.temporary_id == option_value_variant_attrs[:product_option_value_id]
        end
      end
    end

    class Product::Variant::Inventories
      def self.populate(variant, attrs)
        attrs.map { |inventory_attrs| variant.inventories.new(inventory_attrs) }
      end
    end

    class Customer::Prices
      def self.populate(variant, attrs)
        attrs.map { |customer_price_attrs| variant.customer_prices.new(customer_price_attrs) }
      end
    end

    class Product::Variant::PersonalizationFields
      def self.populate(variant, attrs)
        attrs.map do |personalization_field_attrs| 
          variant.personalization_fields.new(personalization_field_attrs)
        end
      end
    end

    class Seo::Listing
      def self.populate(variant, attrs)
        variant.build_seo_listing(attrs)
      end
    end
  end
end