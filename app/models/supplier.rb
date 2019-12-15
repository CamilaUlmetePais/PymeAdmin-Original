class Supplier < ApplicationRecord
	has_many :outflows
	validates :name, :account_balance, presence: true

	def update_balance(outflow)
		new_balance = self.account_balance + outflow.balance
    self.update_attribute(:account_balance, new_balance)
  end
end
