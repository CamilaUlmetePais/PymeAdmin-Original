require 'rails_helper'

RSpec.describe InflowItem, type: :model do

	context "ActiveRecord Associations" do
		it { should belong_to(:inflow).optional }
		it { should belong_to(:product) }
	end

	context InflowItem do
		it { should validate_presence_of(:quantity) }
		it { should validate_presence_of(:product_id) }
		it { should validate_numericality_of(:quantity).is_greater_than(0)}
	end

end

