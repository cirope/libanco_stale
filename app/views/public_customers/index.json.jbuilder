json.array!(@public_customers) do |public_customer|
  json.extract! public_customer, :id, :department, :division
  json.url public_customer_url(public_customer, format: :json)
end
