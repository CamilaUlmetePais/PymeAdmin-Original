class PagesController < ApplicationController

	def statistics
		@inflows = Inflow.all
		@outflows = Outflow.all
		statistics_range unless statistics_params.nil?
		inflows_total      = @inflows.sum('total')
		outflows_total     = @outflows.sum('total')
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

	def statistics_params
		params.require(:pages).permit(:date_from, :date_to) unless params[:pages].nil?
	end

	def statistics_range
		empty = statistics_params[:date_from].empty? && statistics_params[:date_to].empty?
      unless empty
        start_date = DateTime.strptime(statistics_params[:date_from], '%m/%d/%Y')
        end_date = DateTime.strptime(statistics_params[:date_to], '%m/%d/%Y')
        @inflows = @inflows.date_range(start_date, end_date)
        @outflows = @outflows.date_range(start_date, end_date)
      end
	end

	def take_date
		date = DateTime.strptime(take_params[:date], '%m/%d/%Y')
		@inflows = @inflows.date_range(date, date.end_of_day) unless take_params[:date].empty?
		@outflows = @outflows.date_range(date, date.end_of_day) unless take_params[:date].empty?
	end
end
