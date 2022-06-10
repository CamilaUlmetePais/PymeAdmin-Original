class InflowsController < ApplicationController
  before_action :set_inflow, only: [:show, :edit, :update, :destroy]

  # POST /inflows
  # POST /inflows.json
  def create
    @inflow = Inflow.new(inflow_params)
    @inflow.total = generate_inflow_total(inflow_params)
    respond_to do |format|
      if @inflow.save
        @inflow.substract_stock
        @inflow.notification_builder
        format.html { redirect_to inflows_path,
                      notice: {
                        message: I18n.t('activerecord.controllers.actions.created'),
                        model_name: I18n.t('activerecord.models.inflow.one')
                      }
                    }
        format.json { render :show, status: :created, location: @inflow }
      else
        format.html { render :new }
        format.json { render json: @inflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inflows/1
  # DELETE /inflows/1.json
  def destroy
    @inflow.restore_stock
    @inflow.destroy
    respond_to do |format|
      format.html { redirect_to inflows_path,
                    notice: {
                      message: I18n.t('activerecord.controllers.actions.destroyed',
                      model_name: I18n.t('activerecord.models.inflow.one') )
                    }
                  }
      format.json { head :no_content }
    end
  end

  # GET /inflows/1/edit
  def edit
    @products = Product.all
  end

  # GET /inflows
  # GET /inflows.json
  def index
    @inflows = Inflow.all.order(created_at: :desc).page(params[:page])
    search_dates unless search_params.nil?
    search_cash unless search_params.nil?
    @inflows.order(created_at: :desc).page(params[:page])
  end

  # GET /inflows/new
  def new
    @inflow   = Inflow.new
    @inflow.items.build
    @products = Product.all
  end

  def show
  end

  # PATCH/PUT /inflows/1
  # PATCH/PUT /inflows/1.json
  def update
    respond_to do |format|
      successful = false

      @inflow.transaction do
        @inflow.restore_stock
        successful = @inflow.update(inflow_params)
        @inflow.substract_stock
        @inflow.notification_builder
      end

      if successful
        format.html { redirect_to inflows_path,
                      notice: {
                        message: I18n.t('activerecord.controllers.actions.updated',
                        model_name: I18n.t('activerecord.models.inflow.one') )
                      }
                    }
        format.json { render :show, status: :ok, location: @inflow }
      else
        format.html { render :edit }
        format.json { render json: @inflow.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_inflow
      @inflow = Inflow.find(params[:id])
    end

    def inflow_params
      params.require(:inflow).permit(
        :total, :cash, :_destroy, :id,
        inflow_items_attributes: [:id, :quantity, :product_id, :_destroy]
      )
    end

    def search_params
      params.require(:inflow).permit(:created_at_from, :created_at_to, :cash) unless params[:inflow].nil?
    end

    def search_cash
      @inflows = @inflows.cash_scope( helpers.true?(search_params[:cash]) ) unless search_params[:cash].empty?
    end

    def search_dates
      empty = search_params[:created_at_from].empty? && search_params[:created_at_to].empty?
      unless empty
        start_date = DateTime.strptime(search_params[:created_at_from], '%m/%d/%Y')
        end_date = DateTime.strptime(search_params[:created_at_to], '%m/%d/%Y').end_of_day
        @inflows = @inflows.date_range(start_date, end_date)
      end
    end

# Temporary method until javascript subtotal functionality is working in view.
    def generate_inflow_total(params)
      total = 0
      params[:inflow_items_attributes].to_h.values.each do |item|
        product = Product.find(item[:product_id])
        total += item[:quantity].to_f * product.price
      end
      total
    end
end
