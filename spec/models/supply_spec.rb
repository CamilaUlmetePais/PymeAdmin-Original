require 'rails_helper'

RSpec.describe Supply, type: :model do

	context "ActiveRecord Associations" do
		it { should have_many(:outflow_items) }
	end

	context Supply do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:price) }
		it { should validate_presence_of(:unit) }
		it { should validate_presence_of(:stock) }
		it { should validate_numericality_of(:price).is_greater_than(0) }
		it { should validate_uniqueness_of(:name).case_insensitive }
	end

end