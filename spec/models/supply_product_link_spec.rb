require 'rails_helper'

RSpec.describe SupplyProductLink, type: :model do

	context "Validations" do
		it { should validate_presence_of(:product_id) }
		it { should validate_presence_of(:supply_id) }
		it { should validate_uniqueness_of(:product_id) }
		it { should validate_uniqueness_of(:supply_id) }
	end

end
