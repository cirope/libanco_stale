json.array!(@customers) do |customer|
  json.id customer.id
  json.name customer.to_s
  json.informal customer.identification
end
