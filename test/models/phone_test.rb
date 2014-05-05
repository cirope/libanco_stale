require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  def setup
    @phone = phones(:customer_phone)
  end

  test 'blank attributes' do
    @phone = Phone.new

    assert @phone.invalid?
    assert_error @phone, :phone, :blank
  end

  test 'attributes length' do
    @phone.phone = 'abcde' * 52

    assert @phone.invalid?
    assert_error @phone, :phone, :too_long, count: 255
  end

  test 'unique attributes' do
    phone = @phone.dup

    assert phone.invalid?
    assert_error phone, :phone, :taken
  end
end
