class MerchantsPortal::Products::CreateForm
  module Validators

    class Brand
      def self.validate(brand)
        brand.valid?
        brand.errors.full_messages.map { |error| error.prepend("Brand ") }
      end
    end

    class Product
      def self.validate(product)
        brand.valid?
        brand.errors.full_messages
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

        errors.uniq.map { |error| error.prepend("Product Option ") }
      end

      def self.validate_uniqueness_of(options)
        names = options.map(&:name)
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

        errors.uniq.map { |error| error.prepend("Product Option Value ") }
      end

      def self.validate_uniqueness_of(option_values)
        option_values
          .group_by(&:option)
          .values
          .any? { |values| values.size != values.uniq.size } ? ["Value has already been taken"] : []
      end
    end

    class Product::Variants
      def self.validate
      end
    end

    class Product::Variant
      def self.validate
      end
    end

    class Product::OptionValueVariants
      def self.validate
      end
    end

    class Product::Variant::Inventories
      def self.validate
      end
    end

    class Customer::Prices
      def self.validate
      end
    end

    class Product::Variant::PersonalizationFields
      def self.validate
      end
    end
  end
end