require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def setup
    @payment = payments(:first_payment)
  end

  test 'blank attributes' do
    payment = Payment.new(number: '')

    assert payment.invalid?
    assert_error payment, :number, :blank
    assert_error payment, :expire_at, :blank
  end

  test 'payment expired' do
    @payment.update(expire_at: 1.day.ago, paid_at: nil)

    assert @payment.expired?
  end

  test 'invalid date' do
    @payment.paid_at = '1234abc'

    assert @payment.invalid?
    assert_error @payment, :paid_at, :invalid_date
  end
end
