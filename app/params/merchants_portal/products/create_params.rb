class MerchantsPortal::Products::CreateParams
  include ParamsSupport

  def initialize(params = {})
    @params = params
  end

  def permit!
    @params = permit_params(@params)
    @params = format_params(@params)
  end

  private
    def permit_params(params)
      params
        .require(:merchants_portal_products_create_form)
        .permit(
          product: [
            :brand_id,
            :product_type,
            brand: brand_attrs,
            collection_items: collection_item_attrs,
            product_options: product_option_attrs,
            product_variants: product_variant_attrs,
            product_inventories: product_inventory_attrs
          ]
        ).to_h
    end

    def brand_attrs
      [ :name ]
    end

    def collection_item_attrs
      [ :collection_id ]
    end

    def product_option_attrs
      [
        :name,
        :description,
        :position,
        product_option_values: product_option_value_attrs
      ]
    end

    def product_variant_attrs
      [
        :variant_type,
        :master,
        :title,
        :subtitle,
        :description,
        :sku,
        :weight,
        :weight_unit,
        :inventory_multiplier,
        :inventory_multiplier_unit,
        :track_inventory,
        :backorderable,
        :visible_on_storefront,
        :giftable,
        images: [],
        downloads: [],
        care_tags: [],
        search_tags: [],
        seo_listing: seo_listing_attrs,
        customer_prices: customer_price_attrs,
        product_variant_inventories: product_variant_inventory_attrs,
        product_option_value_variants: product_option_value_variant_attrs,
        product_variant_personalization_fields: product_variant_personalization_field_attrs
      ]
    end

    def product_inventory_attrs
      [
        :temporary_id,
        :location_id,
        :unit,
        :quantity_on_hand, 
        :low_inventory_threshold,
        :expires_on
      ]
    end

    def product_option_value_attrs
      [
        :temporary_id,
        :value,
        :position
      ]
    end

    def seo_listing_attrs
      [ 
        :meta_title, 
        :meta_description 
      ]
    end

    def customer_price_attrs
      [
        :price_type, 
        :minimum_order_quantity, 
        :increment_order_quantity, 
        :price, 
        :compare_at_price,
        :display_price,
        :default
      ]
    end

    def product_variant_inventory_attrs
      [ :product_inventory_id ]
    end

    def product_option_value_variant_attrs
      [ :product_option_value_id ]
    end

    def product_variant_personalization_field_attrs
      [
        :label,
        :help_text,
        :placeholder,
        :required,
        :field_type,
        :position,
        options: []
      ]
    end

    def boolean_keys
      [
        [:product, :product_variants, :master],
        [:product, :product_variants, :track_inventory],
        [:product, :product_variants, :backorderable],
        [:product, :product_variants, :giftable],
        [:product, :product_variants, :visible_on_storefront],
        [:product, :product_variants, :customer_prices, :default],
        [:product, :product_variants, :product_variant_personalization_fields, :required]
      ]
    end

    def integer_keys
      []
    end
end