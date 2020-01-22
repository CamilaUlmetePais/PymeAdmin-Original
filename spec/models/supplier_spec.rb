require 'rails_helper'

RSpec.describe Supplier, type: :model do

	context "ActiveRecord Associations" do
		it { should have_many(:outflows) }
	end

	context Supplier do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:account_balance) }
		it { should validate_uniqueness_of(:name).case_insensitive }
	end

end