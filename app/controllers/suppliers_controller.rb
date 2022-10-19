class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to suppliers_path,
                      notice: {
                        message: I18n.t('activerecord.controllers.actions.created',
                        model_name: I18n.t('activerecord.models.supplier.one') )
                      }
                    }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_path,
                    alert: {
                      message: I18n.t('activerecord.controllers.actions.destroyed',
                      model_name: I18n.t('activerecord.models.supplier.one') )
                    }
                  }
      format.json { head :no_content }
    end
  end

  # GET /suppliers/1/edit
  def edit
  end

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.order(:name).page(params[:page]).per(25)
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @transactions = @supplier.outflows.order(created_at: :desc).page(params[:page])
    search_dates unless search_params.nil?
    @transactions.order(created_at: :desc).page(params[:page])
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to suppliers_path,
                      notice: {
                        message: I18n.t('activerecord.controllers.actions.updated',
                        model_name: I18n.t('activerecord.models.supplier.one') )
                      }
                    }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name, :phone_number, :account_balance, :notification_threshold)
    end

    def search_params
      params.require(:supplier).permit(:created_at_from, :created_at_to) unless params[:supplier].nil?
    end

    def search_dates
      empty = search_params[:created_at_from].empty? && search_params[:created_at_to].empty?
      unless empty
        start_date = DateTime.strptime(search_params[:created_at_from], '%m/%d/%Y')
        end_date = DateTime.strptime(search_params[:created_at_to], '%m/%d/%Y').end_of_day
        @transactions = @transactions.date_range(start_date, end_date)
      end
    end
end
