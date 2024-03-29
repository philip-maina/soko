class MerchantsPortal::ProductsController < MerchantsPortal::BaseController
  before_action :set_product, only: %i[ edit update destroy ]
  add_breadcrumb "Products", :merchants_portal_products_path

  def index
  end

  def new
    @products_create_form = MerchantsPortal::Products::CreateForm.new
    @products_create_form.prepopulate
    add_breadcrumb "New Product", :new_merchants_portal_product_path
    
    js(
      brands: Brand.select(:id, :name).as_json,
      locations: Location.select(:id, :name).as_json,
      urls: { create: merchants_portal_products_url }
    )
  end

  def create
    @products_create_form = MerchantsPortal::Products::CreateForm.new(product_create_form_params)

    respond_to do |format|
      format.json do
        if @products_create_form.valid?
          @products_create_form.save!
          render json: {
            success: true,
            errors: [],
            editUrl: edit_merchants_portal_product_url(@products_create_form.product)
          }
        else
          render json: {
            success: false,
            errors: @products_create_form.errors
          }
        end
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_create_form_params
      MerchantsPortal::Products::CreateParams.new(params).permit!
    end
end
