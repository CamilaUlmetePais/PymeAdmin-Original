class InflowsController < ApplicationController
  before_action :set_inflow, only: [:show, :edit, :update, :destroy]

  # GET /inflows
  # GET /inflows.json
  def index
    @inflows = Inflow.all
  end

  # GET /inflows/1
  # GET /inflows/1.json
  def show
  end

  # GET /inflows/new
  def new
    @inflow = Inflow.new
    @inflow.items.build
  end

  # GET /inflows/1/edit
  def edit
  end

  # POST /inflows
  # POST /inflows.json
  def create
    @inflow = Inflow.new(inflow_params)
    respond_to do |format|
      if @inflow.save
        @inflow.update_stocks
        format.html { redirect_to @inflow, notice: I18n.t('activerecord.controllers.actions.created', model_name: I18n.t('activerecord.models.inflow.one') ) }
        format.json { render :show, status: :created, location: @inflow }
      else
        format.html { render :new }
        format.json { render json: @inflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inflows/1
  # PATCH/PUT /inflows/1.json
  def update
    respond_to do |format|
      if @inflow.update(inflow_params)
        format.html { redirect_to @inflow, notice: I18n.t('activerecord.controllers.actions.updated', model_name: I18n.t('activerecord.models.inflow.one') )}
        format.json { render :show, status: :ok, location: @inflow }
      else
        format.html { render :edit }
        format.json { render json: @inflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inflows/1
  # DELETE /inflows/1.json
  def destroy
    @inflow.destroy
    respond_to do |format|
      format.html { redirect_to inflows_url, notice: I18n.t('activerecord.controllers.actions.destroyed', model_name: I18n.t('activerecord.models.inflow.one') ) }
      format.json { head :no_content }
    end
  end

  private
    def set_inflow
      @inflow = Inflow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inflow_params
      params.require(:inflow).permit(
        :total, :cash, :_destroy,
        inflow_items_attributes: [:quantity, :product_id ]
      )
    end
end
