require 'rails_helper'

RSpec.describe Product, type: :model do

	context "ActiveRecord associations" do
	  it { should have_many(:inflow_items) }
	end

	context "validations" do
	  it { should validate_presence_of(:name) }
	  it { should validate_presence_of(:price) }
	  it { should validate_presence_of(:unit) }
	  it { should validate_numericality_of(:stock) }
	  it { should validate_numericality_of(:notification_threshold) }
	  it { should validate_numericality_of(:price).is_greater_than(0) }
	  it { should validate_uniqueness_of(:name).case_insensitive }
	end

	context "notification? method" do
		it "returns true if stock is equal to or less than notification_threshold" do
			@product1 = create(:product, stock: 3, notification_threshold: 10)
			expect(@product1.notification?).to be(true)
		end

		it "returns false if stock is greater than notification_threshold" do
			@product2 = create(:product, stock: 15, notification_threshold: 10)
			expect(@product2.notification?).to be(false)
		end
	end

	context "units_sold method" do
		it "sums up all units sold for a product" do
			@product     = create(:product)
			@inflow      = create(:inflow)
			@inflow_item = create(:inflow_item)

			units_sold = @product.units_sold
			expect(units_sold).to eq(2) # --> because the example inflow item's quantity == 2
		end
	end

	context "update_stock" do
		it "updates the product's stock attribute" do
			@product = create(:product, stock: 100)
			@product.update_stock(50)
			@product.stock == 150
		end
	end

	context "sales_total" do
		it "calculates total money made from sales of a product" do
			@product     = create(:product, price: 5)
			@inflow      = create(:inflow)
			@inflow_item = create(:inflow_item, quantity: 2)

			@product.sales_total == 10
		end
	end

end