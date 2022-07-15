class Supplier < ApplicationRecord
	has_many    :outflows
	has_many    :outflow_items, through: :outflows
	has_many    :supplies, through: :outflow_items
	validates   :name, :account_balance, presence: true
  validates   :account_balance, :notification_threshold, :phone_number, numericality: true
	validates   :name, uniqueness: { case_sensitive: false }

	# Supplier -> {supply_id: id, supplier_id: id, expenses: Float}
	def get_expenses(supply_id, supply_name)
		expenses = self.outflow_items.where(supply_id: supply_id)
		{supply_name: supply_name, supplier_name: self.name, expenses: expenses.sum('quantity')}
	end

  def notification?
    self.account_balance <= self.notification_threshold
  end

  # Restores account_balance to its previous value when an outflow is deleted or updated.
  def restore_balance(outflow)
    new_balance = self.account_balance - (outflow.paid - outflow.total)
    self.update_attributes(account_balance: new_balance)
  end

	# Takes an outflow's parameters and updates the corresponding supplier's account balance.
	def update_balance(outflow)
		new_balance = self.account_balance + (outflow.paid - outflow.total)
    self.update_attributes(account_balance: new_balance)
  end

end
