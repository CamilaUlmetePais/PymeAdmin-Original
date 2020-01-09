class Notification < ApplicationRecord
	validates :title, :text, presence: true
end