class ManualNotification < Notification
	validates :due_date, presence: true
end
