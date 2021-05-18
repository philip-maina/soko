class MerchantsPortal::ProductsController < MerchantsPortal::BaseController
  before_action :set_product, only: %i[ edit update destroy ]

  def index
  end

  def new
    @products_create_form = MerchantsPortal::Products::CreateForm.new
    @products_create_form.prepopulate
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
            editUrl: merchants_portal_edit_product_url(@products_create_form.product)
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
