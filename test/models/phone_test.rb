require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  def setup
    @phone = phones(:phone)
  end

  test 'blank attributes' do
    @phone = Phone.new

    assert @phone.invalid?
    assert_error @phone, :phone, :blank
    assert_error @phone, :customer_id, :blank
  end
end
