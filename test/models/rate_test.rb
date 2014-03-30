require 'test_helper'

class RateTest < ActiveSupport::TestCase
  def setup
    @rate = rates(:rate_1)
  end

  test 'blank attributes' do
    @rate = Rate.new(payments_count: '', rate: nil)

    assert @rate.invalid?
    assert_error @rate, :payments_count, :blank
    assert_error @rate, :rate, :blank
  end

  test 'unique attributes' do
    @rate.payments_count = rates(:rate_2).payments_count

    assert @rate.invalid?
    assert_error @rate, :payments_count, :taken
  end
end
