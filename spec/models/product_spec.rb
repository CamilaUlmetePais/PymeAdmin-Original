require 'rails_helper'

RSpec.describe Product, type: :model do

	context "ActiveRecord Associations" do
	  it { should have_many(:inflow_items) }
	end

	context "When a Product is created" do
	  it { should validate_presence_of(:name) }
	  it { should validate_presence_of(:price) }
	  it { should validate_presence_of(:unit) }
	  it { should_not allow_value(-9).for(:price) }
	  it { should validate_uniqueness_of(:name).case_insensitive }
	end

end