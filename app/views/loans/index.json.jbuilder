json.array!(@loans) do |loan|
  json.extract! loan, :id, :amount, :payment, :payments_count, :expire_at
  json.url loan_url(loan, format: :json)
end
