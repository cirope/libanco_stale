module PaymentsHelper
  def payments_taxes_total(payment)
    payment.taxes.map(&:value).reduce(:+) || 0
  end
end
