json.array!(@rate_sets) do |rate_set|
  json.extract! rate_set, :id, :name
  json.url rate_set_url(rate_set, format: :json)
end
