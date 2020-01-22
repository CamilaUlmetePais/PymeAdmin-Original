require 'rails_helper'

RSpec.describe OutflowItem, type: :model do

	context "ActiveRecord Associations" do
		it { should belong_to(:outflow).optional }
		it { should belong_to(:supply) }
	end

end