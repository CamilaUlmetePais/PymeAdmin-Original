require 'rails_helper'

RSpec.describe Inflow, type: :model do

	context "ActiveRecord Associations" do
		it { should have_many(:inflow_items) }
		it { should accept_nested_attributes_for(:inflow_items).allow_destroy(true) }
	end

	context Inflow do
		it { should validate_presence_of(:total) }
	end

end