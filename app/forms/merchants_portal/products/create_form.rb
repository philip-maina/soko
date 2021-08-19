# There are two completely separated modes for form setup.
#   Prepopulator mode: When rendering the form i.e new and edit
#   Populator mode: When populating the form in validate before saving i.e create and update
class MerchantsPortal::Products::CreateForm
  include Populators, Validators

  attr_reader :params, 
              :errors

  attr_accessor :brand, :collection_items, :customer_prices, 
                :product, :product_inventories, 
                :product_options, :product_option_values, :product_option_value_variants,
                :product_variants, :product_variant_inventories, :product_variant_personalization_fields, 
                :seo_listings

  def initialize(params = {})
    @params = params
    @errors = []
  end

  def prepopulate
  end

  def valid?
    @errors = []
    populate
    validate
    errors.blank?
  end

  def save!
    return unless errors.blank?
    
    ActiveRecord::Base.transaction do
      brand.save! if brand
      product.save!
      collection_items.each(&:save!)
      product_inventories.each(&:save!)
      product_options.each(&:save!)
      product_option_values.each(&:save!)
      product_variants.each(&:save!)
      product_option_value_variants.each(&:save!)
      product_variant_inventories.each(&:save!)
      customer_prices.each(&:save!)
      product_variant_personalization_fields.each(&:save!)
      seo_listings.each(&:save!)

      # Event::Product::Created.create!(product: product)
    end
  end

  private
    def populate
      unless params.blank?
        @brand   = ::Brand.find_by(id: params[:product][:brand_id]) || Populators::Brand.populate(params[:product][:brand])
        @product = Populators::Product.populate(@brand, params[:product].slice(:product_type))
        @collection_items = Populators::Collection::Items.populate(@product, params[:product][:collection_items])
        @product_inventories = Populators::Product::Inventories.populate(@product, params[:product][:product_inventories])

        @product_options,
        @product_option_values = Populators::Product::Options.populate(@product, params[:product][:product_options])

        @product_variants,
        @product_option_value_variants,
        @product_variant_inventories,
        @customer_prices,
        @product_variant_personalization_fields,
        @seo_listings = Populators::Product::Variants.populate(@product, @product_inventories, @product_option_values, params[:product][:product_variants])
      end
    end

    def validate
      @errors.concat(Validators::Brand.validate(brand)) if brand
      @errors.concat(Validators::Product.validate(product))
      @errors.concat(Validators::Collection::Items.validate(collection_items))
      @errors.concat(Validators::Product::Inventories.validate(product_inventories))
      @errors.concat(Validators::Product::Options.validate(product_options))
      @errors.concat(Validators::Product::OptionValues.validate(product_option_values))
      @errors.concat(Validators::Product::Variants.validate(product_variants))
      @errors.concat(Validators::Product::OptionValueVariants.validate(product_option_value_variants))
      @errors.concat(Validators::Product::VariantInventories.validate(product_variant_inventories))
      @errors.concat(Validators::Customer::Prices.validate(customer_prices))
      @errors.concat(Validators::Product::Variant::PersonalizationFields.validate(product_variant_personalization_fields))
      @errors.concat(Validators::Seo::Listings.validate(seo_listings))
      @errors.uniq!
    end
end