require 'test_helper'

class TaxTest < ActiveSupport::TestCase
  def setup
    @tax = taxes(:first_tax)
  end

  test 'blank attributes' do
    @tax = Tax.new(value: nil)

    assert @tax.invalid?
    assert_error @tax, :value, :blank
    assert_error @tax, :tax_setting, :blank
    assert_error @tax, :customer, :blank
  end

  test 'attributes boundaries' do
    @tax.value = -1

    assert @tax.invalid?
    assert_error @tax, :value, :greater_than, count: 0

    @tax.value = 10_000_000_000_000.00
    assert @tax.invalid?
    assert_error @tax, :value, :less_than, count: 9_999_999_999_999.99
  end
end
