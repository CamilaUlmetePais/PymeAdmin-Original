class PagesController < ApplicationController
	before_action :authenticate_admin

	def expenses
    @all_outflows = Outflow.all
    @outflows = Outflow.all
    @all_inflows = Inflow.all
    @inflows = Inflow.all
    if !search_params.nil?
  		empty = search_params[:date_from].empty? && search_params[:date_to].empty?
      unless empty
        start_date = DateTime.strptime(search_params[:date_from], '%m/%d/%Y').beginning_of_month
        end_date = DateTime.strptime(search_params[:date_to], '%m/%d/%Y').end_of_month
        @outflows = @outflows.date_range(start_date, end_date) unless empty
      end
    end
		@variables = {
    }
	end

	def profit
		@inflows  = Inflow.all
		@outflows = Outflow.all
    if !search_params.nil?
  		empty = search_params[:date_from].empty? && search_params[:date_to].empty?
      unless empty
        start_date = DateTime.strptime(search_params[:date_from], '%m/%d/%Y').beginning_of_month
        end_date = DateTime.strptime(search_params[:date_to], '%m/%d/%Y').end_of_month
        @outflows = @outflows.date_range(start_date, end_date) unless empty
        @inflows  = @inflows.date_range(start_date, end_date) unless empty
      end
    end
		@variables = {
    }
	end

	def sales
		@inflows  = Inflow.all
    if !search_params.nil?
  		empty = search_params[:date_from].empty? && search_params[:date_to].empty?
      unless empty
        start_date = DateTime.strptime(search_params[:date_from], '%m/%d/%Y').beginning_of_month
        end_date = DateTime.strptime(search_params[:date_to], '%m/%d/%Y').end_of_month
        @inflows = @inflows.date_range(start_date, end_date) unless empty
      end
    end
		@variables = {
    }
	end

	def take
		@inflows   = Inflow.all
		@outflows  = Outflow.all
		take_date unless take_params.nil?
		@variables = {
			cash_inflows: @inflows.where(cash: true),
			cash_outflows: @outflows.where(cash: true),
			inflow_total: @inflows.sum('total'),
			outflow_total: @outflows.sum('total')
		}
	end

	private
	def search_params
		params.require(:pages).permit(:date_from, :date_to) unless params[:pages].nil?
	end

	def take_params
		params.require(:pages).permit(:date) unless params[:pages].nil?
	end

	def take_date
		date = DateTime.strptime(take_params[:date], '%m/%d/%Y')
		@inflows = @inflows.date_range(date, date.end_of_day) unless take_params[:date].empty?
		@outflows = @outflows.date_range(date, date.end_of_day) unless take_params[:date].empty?
	end

end
