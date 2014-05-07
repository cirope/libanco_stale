module PaymentsHelper
  def show_current_payments(payment)
    "#{payment.number}/#{payment.loan.payments_count}"
  end
end
