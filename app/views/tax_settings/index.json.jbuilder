json.array!(@tax_settings) do |tax_setting|
  json.extract! tax_setting, :id, :name, :value, :account_id
  json.url tax_setting_url(tax_setting, format: :json)
end
