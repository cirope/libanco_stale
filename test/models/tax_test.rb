require 'test_helper'

class TaxTest < ActiveSupport::TestCase
  def setup
    @tax = taxes(:first_tax)
  end

  test 'blank attributes' do
    @tax = Tax.new(name: '', value: nil)

    assert @tax.invalid?
    assert_error @tax, :name, :blank
    assert_error @tax, :value, :blank
    assert_error @tax, :payment, :blank
  end

  test 'length attributes' do
    @tax.name = 'abcde' * 52

    assert @tax.invalid?
    assert_error @tax, :name, :too_long, count: 255
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
