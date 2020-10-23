class PagesController < ApplicationController
	before_action :authenticate_admin

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
	def take_params
		params.require(:pages).permit(:date) unless params[:pages].nil?
	end

	def take_date
		date = DateTime.strptime(take_params[:date], '%m/%d/%Y')
		@inflows = @inflows.date_range(date, date.end_of_day) unless take_params[:date].empty?
		@outflows = @outflows.date_range(date, date.end_of_day) unless take_params[:date].empty?
	end
end
