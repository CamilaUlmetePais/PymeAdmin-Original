class Notification < ApplicationRecord
	validates :title, :text, presence: true

  scope :last_60_days, -> { where('created_at >= ?', 60.days.ago) }
end