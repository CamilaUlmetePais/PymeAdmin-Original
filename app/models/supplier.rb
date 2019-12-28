class Supplier < ApplicationRecord
	has_many :outflows
	has_many :outflow_items, through: :outflows
	has_many :supplies, through: :outflow_items
	validates :name, :account_balance, presence: true
	validates :name, uniqueness: { case_sensitive: false }

	# Supplier -> {supply_id: id, supplier_id: id, expenses: Float}
	def get_expenses(supply_id, supply_name)
		expenses = self.outflow_items.where(supply_id: supply_id)
		{supply_name: supply_name, supplier_name: self.name, expenses: expenses.sum('quantity')}
	end

	def update_balance(outflow)
		new_balance = self.account_balance + outflow.balance
    self.update_attribute(:account_balance, new_balance)
  end
end
