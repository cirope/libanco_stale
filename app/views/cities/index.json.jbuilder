json.array!(@cities) do |city|
  json.extract! city, :id, :name, :zip_code
  json.url city_url(city, format: :json)
end
