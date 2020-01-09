class SupplyProductLinksController < ApplicationController
	before_action :set_supply_product_link, only: [:show, :edit, :destroy]

  def create
    @supply_product_link = SupplyProductLink.new(supply_product_link_params)
    respond_to do |format|
      if @supply_product_link.save
        format.html { redirect_to supply_product_links_path, notice: {
          message: I18n.t('activerecord.controllers.actions.created',
            model_name: I18n.t('activerecord.models.supply_product_link.one') ) }
        }
      else
        format.html { render :new }
        format.json { render json: @supply_product_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supply_product_link.destroy
    respond_to do |format|
      format.html { redirect_to supply_product_links_path, notice: {
        message: I18n.t('activerecord.controllers.actions.destroyed',
          model_name: I18n.t('activerecord.models.supply_product_link.one') ) }
      }
      format.json { head :no_content }
    end
  end

  def edit
  end

	def index
		@supply_product_links = SupplyProductLink.all
	end

	def new
		@supply_product_link = SupplyProductLink.new
    @products = Product.all
    @supplies = Supply.all
	end

 private
   def set_supply_product_link
     @supply_product_link = SupplyProductLink.find(params[:id])
   end

   def supply_product_link_params
     params.require(:supply_product_link).permit(:product_id, :supply_id)
   end

end