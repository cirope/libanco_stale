require 'test_helper'

class PaymentTaxTest < ActiveSupport::TestCase
  def setup
    @payment_tax = payment_taxes :first_payment_tax
  end

  test 'blank attributes' do
    @payment_tax = PaymentTax.new

    assert @payment_tax.invalid?
    assert_error @payment_tax, :payment, :blank
    assert_error @payment_tax, :tax, :blank
  end
end
