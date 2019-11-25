json.extract! supplier, :id, :name, :phone_number, :account_balance, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
