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
    assert_error payment, :loan, :blank
  end

  test 'payment expired' do
    @payment.update(expire_at: 1.day.ago, paid_at: nil)

    assert @payment.expired?
  end

  test 'should remove taxes' do
    assert_equal TaxSetting.count, @payment.taxes.count
    @payment.update(paid_at: nil)

    # because expire_at is in the future
    assert_equal 0, @payment.taxes.count
  end

  test 'should assign taxes' do
    payment = payments(:second_payment)
    assert_equal 0, payment.taxes.count

    payment.update(paid_at: 1.month.from_now)
    assert_equal TaxSetting.count, payment.taxes.count
  end
end
