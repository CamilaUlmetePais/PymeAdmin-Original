require 'rails_helper'

RSpec.describe ManualNotification, type: :model do

	context ManualNotification do
		it { should validate_presence_of(:due_date) }
	end

end