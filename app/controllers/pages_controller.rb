class PagesController < ApplicationController

	def statistics
		inflows_total      = Inflow.all.sum('total')
		outflows_total     = Outflow.all.sum('total')
		supplies           = Supply.all
		consumables        = supplies.where.not(unit: "$")
		operative_expenses = supplies - consumables
		op_ex_by_supplier  = operative_expenses.map{|supply| supply.get_operative_expenses}.flatten

		@products   = Product.all
		@suppliers  = Supplier.all
		@statistics = {
			gross_income: inflows_total,
			total_expenses: outflows_total,
			balance: inflows_total - outflows_total,
			consumables: consumables,
			operative_expenses: operative_expenses,
			op_ex_by_supplier: op_ex_by_supplier
			}
	end

	def take
		@inflows   = Inflow.all
		@outflows  = Outflow.all
		scope_entries unless search_params.nil?
		@variables = {
			cash_inflows: @inflows.where(cash: true),
			cash_outflows: @outflows.where(cash: true),
			inflow_total: @inflows.sum('total'),
			outflow_total: @outflows.sum('total')
		}
	end

	private

	def search_params
		params.require(:pages).permit(:date) unless params[:pages].nil?
	end

	def scope_entries
		date = DateTime.strptime(search_params[:date], '%m/%d/%Y')
		@inflows = @inflows.date_range(date, date.end_of_day) unless search_params[:date].empty?
		@outflows = @outflows.date_range(date, date.end_of_day) unless search_params[:date].empty?
	end
end
