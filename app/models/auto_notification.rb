class AutoNotification < Notification

	def self.stock_alert(product)
		params = {
			title: I18n.t('auto_notification.stock_alert.title', product: product.name),
			text: I18n.t('auto_notification.stock_alert.text', product: product.name, stock: product.stock),
			due_date: DateTime.now
		}
		self.create(params)
	end

	def self.balance_alert(supplier)
		difference = supplier.notification_threshold - supplier.account_balance
		params     = {
			due_date: DateTime.now,
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

