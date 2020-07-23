require 'rails_helper'

RSpec.describe AutoNotification, type: :model do

	context "stock_alert method" do
		it "creates a notification when a product's stock falls below the threshold" do
			# In this example the notification is created when product.stock falls below the notification_threshold assigned.
			@product = create(:product, name: "Pollo", stock: 10, notification_threshold: 5)
			@last_notification = AutoNotification.last

			@inflow = create(:inflow)
			@inflow_item1 = create(:inflow_item, quantity: 7)
			@inflow.substract_stock
			AutoNotification.stock_alert(@product)

			expect(AutoNotification.last).not_to eq(@last_notification)
			expect(AutoNotification.last.title).to be == I18n.t('auto_notification.stock_alert.title', product: @product.name)
			expect(AutoNotification.last.text).to be == I18n.t('auto_notification.stock_alert.text', product: @product.name, stock: @product.stock)
		end
	end

	context "balance_alert method" do
		it "creates a notification when a supplier's account_balance falls below the threshold" do
			# In this example the notification is created when supplier.account_balance falls below the notification_threshold assigned.
			@supplier = create(:supplier, account_balance: 0, notification_threshold: -100)
			@last_notification = AutoNotification.last

			@outflow = create(:outflow, total: 200, paid: 50)
			@outflow.supplier.update_balance(@outflow)
			@difference = @supplier.notification_threshold - @supplier.account_balance
			AutoNotification.balance_alert(@supplier)

			expect(AutoNotification.last).not_to be ==(@last_notification)
			expect(AutoNotification.last.title).to be == I18n.t('auto_notification.balance_alert.title', supplier: @supplier.name)
			expect(AutoNotification.last.text).to be == I18n.t('auto_notification.balance_alert.text',
				supplier: @supplier.name,
				balance: @supplier.account_balance,
				difference: @difference
				)
		end
	end

end