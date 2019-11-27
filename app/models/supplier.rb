class Supplier < ApplicationRecord
	has_many :outflows
	validates :name, presence: true
	validates :account_balance, numericality: { greater_than: 0 }

	def update_balance(outflow)
		new_balance = self.account_balance - outflow.amount
        self.update_attribute(:account_balance, new_balance)
    end
end
