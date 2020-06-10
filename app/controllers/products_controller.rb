class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:mass_stock_update]

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: { message: I18n.t('activerecord.controllers.actions.created', model_name: I18n.t('activerecord.models.product.one') ), html_class: 'success' } }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: { message: I18n.t('activerecord.controllers.actions.destroyed', model_name: I18n.t('activerecord.models.product.one') ), html_class: 'danger' } }
      format.json { head :no_content }
    end
  end

  # GET /products/1/edit
  def edit
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def mass_stock
  end

  def mass_stock_update
    products = product_params[:mass_stock]
    products.each do |parameters|
      unless parameters[:product_id].empty? || parameters[:stock].empty?
        product = Product.find(parameters[:product_id].to_i)
        product.update_stock(parameters[:stock].to_i)
      end
    end
    respond_to do |format|
      format.html { redirect_to products_path, notice: I18n.t('activerecord.controllers.actions.stock_updated') }
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: { message: I18n.t('activerecord.controllers.actions.updated', model_name: I18n.t('activerecord.models.product.one') ), html_class: 'success' } }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :unit, :promotion_price, :stock, mass_stock: [:product_id, :stock])
    end
end
