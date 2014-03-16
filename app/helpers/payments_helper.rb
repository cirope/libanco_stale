module PaymentsHelper
  def payments_taxes_total(payment)
    payment.taxes.map(&:value).reduce(:+)
  end
end
