class AutoNotification < Notification
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
			params     = {
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
end

