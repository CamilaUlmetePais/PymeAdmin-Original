require 'rails_helper'

RSpec.describe AutoNotification, type: :model do

	context "Stock_alert method" do
		it "creates a notification when a product's stock falls below the threshold" do
			@product     = create(:product, name: "Pollo", stock: 4, notification_threshold: 5)

			@last_notification = AutoNotification.last

			AutoNotification.stock_alert(@product)

			expect(AutoNotification.last).not_to eq(@last_notification)
		end
	end

	context "Balance_alert method" do
		it "creates a notification when a supplier's account_balance falls below the threshold" do
			@supplier = create(:supplier, account_balance: -120, notification_threshold: -100)

			@last_notification = AutoNotification.last

			AutoNotification.balance_alert(@supplier)

			expect(AutoNotification.last).not_to eq(@last_notification)
		end
	end

end