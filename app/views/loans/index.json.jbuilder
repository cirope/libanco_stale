json.array!(@loans) do |loan|
  json.extract! loan, :id, :amount, :payment, :debt, :payments_count, :expired_payments_count, :payments_to_expire_count, :expired_at, :customer_id, :user_id, :account_id
  json.url loan_url(loan, format: :json)
end
