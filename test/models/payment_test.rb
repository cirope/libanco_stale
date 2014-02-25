require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def setup
    @payment = payments(:first_payment)
  end

  test 'blank attributes' do
    @payment = Payment.new(number: '')

    assert @payment.invalid?
    assert_error @payment, :number, :blank
    assert_error @payment, :expired_at, :blank
    assert_error @payment, :loan, :blank
  end
end
