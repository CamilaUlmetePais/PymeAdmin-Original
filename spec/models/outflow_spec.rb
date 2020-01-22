require 'rails_helper'

RSpec.describe Outflow, type: :model do

	context "ActiveRecord Association" do
		it { should have_many(:outflow_items).dependent(:destroy) }
		it { should belong_to(:supplier) }
		it { should accept_nested_attributes_for(:outflow_items).allow_destroy(true) }
	end

	context Outflow do
		it { should validate_presence_of(:total) }
		it { should validate_presence_of(:paid) }
		it { should validate_presence_of(:supplier_id) }
		it { should validate_numericality_of(:total).is_greater_than(0) }
	end

end