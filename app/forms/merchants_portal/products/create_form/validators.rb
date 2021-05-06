class MerchantsPortal::Products::CreateForm
  module Validators

    class Brand
      def self.validate(brand)
        brand.valid?
        brand.errors.full_messages.map { |error| error.prepend("Brand's ") }
      end
    end

    class Product
      def self.validate(product)
        product.valid?
        product.errors.full_messages.map { |error| error.prepend("Product's ") }
      end
    end

    class Collection::Items
      def self.validate(collection_items)
        collection_items.map do |collection_item|
          collection_item.valid?
          collection_item.errors.full_messages
        end.flatten.uniq
      end
    end

    class Product::Options
      # validate that the submitted list of options are unique,
      # validate each option
      def self.validate(options)
        errors = []

        errors.concat(validate_uniqueness_of(options))

        errors.concat(
          options.reduce([]) do |acc, option|
            option.valid?
            acc.concat(option.errors.full_messages)
          end
        )

        errors.uniq.map { |error| error.prepend("Product Option's ") }
      end

      def self.validate_uniqueness_of(options)
        names = options.map(&:name).compact
        names.size != names.uniq.size ? ["Name has already been taken"] : []
      end
    end

    class Product::OptionValues
      # validate that the submitted option values scoped to an option are unique
      # validate each option value
      def self.validate(option_values)
        errors = []

        errors.concat(validate_uniqueness_of(option_values))

        errors.concat(
          option_values.reduce([]) do |acc, option_value|
            option_value.valid?
            acc.concat(option_value.errors.full_messages)
          end
        )

        errors.uniq.map { |error| error.prepend("Product Option Value's ") }
      end

      def self.validate_uniqueness_of(option_values)
        option_values
          .group_by(&:option)
          .transform_values { |grouped_option_values| grouped_option_values.map(&:value).compact }
          .values
          .any? { |values| values.size != values.uniq.size } ? ["Value has already been taken"] : []
      end
    end

    class Product::Variants
      def self.validate(variants)
        errors = []
        errors.concat(validate_uniqueness_of(variants))
        errors.concat(variants.reduce([]) { |acc, variant| acc.concat(Product::Variant.validate(variant)) })
        errors.uniq.map { |error| error.prepend("Product Variant's ") }
      end

      def self.validate_uniqueness_of(variants)
        skus = variants.map(&:sku).compact
        skus.size != skus.uniq.size ? ["Sku has already been taken"] : []
      end
    end

    class Product::Variant
      def self.validate(variant)
        variant.valid?
        variant.errors.full_messages
      end
    end

    class Product::OptionValueVariants
      def self.validate(option_value_variants)
        errors = []

        errors.concat(
          option_value_variants.reduce([]) do |acc, option_value_variant|
            option_value_variant.valid?
            acc.concat(option_value_variant.errors.full_messages)
          end
        )

        errors.uniq.map { |error| error.prepend("Product Option Value Variant's ") }
      end
    end

    class Product::Variant::Inventories
      def self.validate(inventories)
        errors = []

        errors.concat(
          inventories.reduce([]) do |acc, inventory|
            inventory.valid?
            acc.concat(inventory.errors.full_messages)
          end
        )

        errors.uniq.map { |error| error.prepend("Product Variant Inventory's ") }
      end
    end

    class Customer::Prices
      def self.validate(customer_prices)
        errors = []

        errors.concat(
          customer_prices.reduce([]) do |acc, customer_price|
            customer_price.valid?
            acc.concat(customer_price.errors.full_messages)
          end
        )

        errors.uniq.map { |error| error.prepend("Customer Price's ") }
      end
    end

    class Product::Variant::PersonalizationFields
      def self.validate(personalization_fields)
        errors = []

        errors.concat(validate_uniqueness_of(personalization_fields))

        errors.concat(
          personalization_fields.reduce([]) do |acc, personalization_field|
            personalization_field.valid?
            acc.concat(personalization_field.errors.full_messages)
          end
        )

        errors.uniq.map { |error| error.prepend("Product Variant Personalization Field's ") }
      end

      def self.validate_uniqueness_of(personalization_fields)
        personalization_fields
          .group_by(&:variant)
          .transform_values { |grouped_fields| grouped_fields.map(&:label).compact }
          .values
          .any? { |labels| labels.size != labels.uniq.size } ? ["Label has already been taken"] : []
      end
    end
  end

  class Seo::Listings
    def self.validate(seo_listings)
      errors = []

      errors.concat(
        seo_listings.reduce([]) do |acc, seo_listing|
          seo_listing.valid?
          acc.concat(seo_listing.errors.full_messages)
        end
      )

      errors.uniq.map { |error| error.prepend("Seo Listing's ") }
    end
  end
end