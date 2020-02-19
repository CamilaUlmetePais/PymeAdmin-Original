require 'rails_helper'

RSpec.describe AutoNotification, type: :model do

	context "Stock_alert method" do
		it "creates a notification when a product's stock falls below the stipulated threshold" do
			@product     = create(:product, stock: 20, notification_threshold: 5)
			@inflow      = create(:inflow)
			@inflow_item = create(:inflow_item, quantity: 16)

			stock_alert(@product)
			# Expect: create notification
		end
	end

	context "Balance_alert method" do
		it "creates a notification when a supplier's account_balance falls below the stipulated threshold" do
			@supplier = create(:supplier, notification_threshold: -100)
			@outflow  = create(:outflow, total: -120)

			balance_alert(@supplier)
			# Expect: create notification
		end
	end

end

=begin

def stock_alert(product)
		if product.stock <= product.notification_threshold
			params = {
				title: I18n.t('auto_notification.stock_alert.title', product: product.name),
				text: I18n.t('auto_notification.stock_alert.text', product: product.name, stock: product.stock),
				due_date: Datetime.now
			}
			self.create(params)
		end
	end

	def balance_alert(supplier)
		if supplier.account_balance <= supplier.notification_threshold
			difference = supplier.notification_threshold - supplier.account_balance
			params = {
				due_date: Datetime.now,
				title: I18n.t('auto_notification.balance_alert.title', supplier: supplier.name),
				text: I18n.t('auto_notification.balance_alert.text',
					supplier: supplier.name,
					balance: supplier.account_balance,
					difference: difference
					)
			}
			self.create(params)
		end
	end

=end