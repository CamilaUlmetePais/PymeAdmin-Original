class PagesController < ApplicationController
	before_action :authenticate_admin

	def expenses
		@inflows  = Inflow.all
		@outflows = Outflow.all
		empty = search_params[:created_at_from].empty? && search_params[:created_at_to].empty?
    unless empty
      start_date = DateTime.strptime(search_params[:created_at_from], '%m/%d/%Y').beginning_of_month
      end_date = DateTime.strptime(search_params[:created_at_to], '%m/%d/%Y').end_of_month
      @outflows = @outflows.date_range(start_date, end_date)
    end
		@variables = {
    }
	end

	def profit
		@inflows  = Inflow.all
		@outflows = Outflow.all
		empty = search_params[:created_at_from].empty? && search_params[:created_at_to].empty?
    unless empty
      start_date = DateTime.strptime(search_params[:created_at_from], '%m/%d/%Y').beginning_of_month
      end_date = DateTime.strptime(search_params[:created_at_to], '%m/%d/%Y').end_of_month
      @outflows = @outflows.date_range(start_date, end_date)
    end
		@variables = {
    }
	end

	def sales
		@inflows  = Inflow.all
		@outflows = Outflow.all
		empty = search_params[:created_at_from].empty? && search_params[:created_at_to].empty?
    unless empty
      start_date = DateTime.strptime(search_params[:created_at_from], '%m/%d/%Y').beginning_of_month
      end_date = DateTime.strptime(search_params[:created_at_to], '%m/%d/%Y').end_of_month
      @outflows = @outflows.date_range(start_date, end_date)
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
		params.require(:pages).permit(:created_at_from, :created_at_to) unless params[:pages].nil?
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
