class PagesController < ApplicationController

	def statistics
		inflows_total = Inflow.all.sum('total')
		outflows_total = Outflow.all.sum('total')
		supplies = Supply.all
		consumables = supplies.where.not(unit: "$")
		operative_expenses = supplies - consumables
		op_ex_by_supplier = operative_expenses.map{|supply| supply.get_operative_expenses}.flatten

		@products = Product.all
		@suppliers = Supplier.all
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
		@inflows = Inflow.all
		@outflows = Outflow.all
		@variables = {
			cash_inflows: @inflows.where(cash: true),
			cash_outflows: @outflows.where(cash: true),
			inflow_total: @inflows.sum('total'),
			outflow_total: @outflows.sum('total')
		}
	end
end
