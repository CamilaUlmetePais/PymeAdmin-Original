FactoryBot.define do

	factory :inflow do
		total { 150.25 }
		cash { true }
	end

	factory :inflow_item do
		quantity { 2 }
		product_id { 1 }
		inflow_id { 1 }
		inflow
	end

	factory :notification do
		title { "Test" }
		text { "Text_test" }
		done { false }
		type { "manual_notification" }
		due_date { DateTime.new(2018,2,3,4,5,6) }
	end

	factory :outflow do
		total { 100.35 }
		cash { false }
		notes { "Text_test" }
		supplier_id { 1 }
		paid { 125 }
	end

	factory :outflow_item do
		quantity { 3.50 }
		supply_id { 1 }
		outflow_id { 1 }
		outflow
	end

	factory :product do
		name { "Test" }
		price { 2 }
		unit { "kg" }
		stock { 100 }
		notification_threshold { 2 }
	end

	factory :supplier do
		name { "Test" }
		phone_number { 1122334455 }
		account_balance { 500 }
		notification_threshold { -200 }
	end

	factory :supply do
		name { "Test" }
		price { 125 }
		unit { "kg" }
		stock { 165.45 }
	end

	factory :supply_product_link do
		product_id { 1 }
		supply_id { 1 }
	end

end

