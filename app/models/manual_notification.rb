class ManualNotification < Notification
	validates :due_date, :title, presence: true
end
