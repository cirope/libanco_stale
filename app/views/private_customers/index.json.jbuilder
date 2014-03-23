json.array!(@private_customers) do |private_customer|
  json.extract! private_customer, :id, :company_id
  json.url private_customer_url(private_customer, format: :json)
end
