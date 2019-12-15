class PagesController < ApplicationController

	def take
		@inflows = Inflow.all
		@outflows = Outflow.all
		@variables = {
			cash_inflows: @inflows.where(cash: true),
			cash_outflows: @outflows.where(cash: true),
			inflow_total: @inflows.sum('total'),
			outflow_total: @outflows.sum('total')
		}
	end

	def statistics
		@inflows = Inflow.all
		@outflows = Outflow.all
		@products = Product.all
	end
end