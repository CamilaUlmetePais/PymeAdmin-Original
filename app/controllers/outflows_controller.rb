class OutflowsController < ApplicationController
  before_action :set_outflow, only: [:show, :edit, :update, :destroy]

  # POST /outflows
  # POST /outflows.json
  def create
    @outflow = Outflow.new(outflow_params)
    respond_to do |format|
      if @outflow.save
        @outflow.update_stocks
        @outflow.supplier.update_balance(@outflow)
        format.html { redirect_to outflows_path, notice: { message: I18n.t('activerecord.controllers.actions.created', model_name: I18n.t('activerecord.models.outflow.one') ), html_class: 'success' } }
        format.json { render :show, status: :created, location: @outflow }
      else
        format.html { render :new }
        format.json { render json: @outflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outflows/1
  # DELETE /outflows/1.json
  def destroy
    @outflow.destroy
    respond_to do |format|
      format.html { redirect_to outflows_path, notice: { message: I18n.t('activerecord.controllers.actions.destroyed', model_name: I18n.t('activerecord.models.outflow.one') ), html_class: 'danger' } }
      format.json { head :no_content }
    end
  end

  # GET /outflows/1/edit
  def edit
  end

  # GET /outflows
  # GET /outflows.json
  def index
    @outflows = Outflow.all
  end

  # GET /outflows/new
  def new
    @outflow = Outflow.new
    @outflow.items.build
  end

  # PATCH/PUT /outflows/1
  # PATCH/PUT /outflows/1.json
  def update
    respond_to do |format|
      if @outflow.update(outflow_params)
        format.html { redirect_to outflows_path, notice: { message: I18n.t('activerecord.controllers.actions.updated', model_name: I18n.t('activerecord.models.outflow.one') ), html_class:'success' } }
        format.json { render :show, status: :ok, location: @outflow }
      else
        format.html { render :edit }
        format.json { render json: @outflow.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outflow
      @outflow = Outflow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outflow_params
      params.require(:outflow).permit(
        :total, :paid, :cash, :notes, :supplier_id,
        outflow_items_attributes: [:quantity, :supply_id]
      )
    end
end
