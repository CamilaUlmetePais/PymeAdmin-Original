require 'rails_helper'

RSpec.describe Notification, type: :model do

	context "Validations" do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:text) }
	end

end