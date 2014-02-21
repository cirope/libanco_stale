json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :lastname, :identification, :address, :city_id
  json.url customer_url(customer, format: :json)
end
