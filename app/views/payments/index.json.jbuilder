json.array!(@payments) do |payment|
  json.extract! payment, :id, :number, :expired_at, :paid_at, :loan_id
  json.url payment_url(payment, format: :json)
end
