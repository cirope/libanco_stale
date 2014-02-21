require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:paul)
  end

  test 'blank attributes' do
    @customer = Customer.new(name: '', lastname: '')

    assert @customer.invalid?
    assert_error @customer, :name, :blank
    assert_error @customer, :lastname, :blank
    assert_error @customer, :identification, :blank
    assert_error @customer, :address, :blank
    assert_error @customer, :city, :blank
  end

  test 'unique attributes' do
    @customer.identification = customers(:simon).identification

    assert @customer.invalid?
    assert_error @customer, :identification, :taken
  end

  test 'attributes length' do
    @customer.name = 'abcde' * 52
    @customer.lastname = 'abcde' * 52
    @customer.address = 'abcde' * 52

    assert @customer.invalid?
    assert_error @customer, :name, :too_long, count: 255
    assert_error @customer, :lastname, :too_long, count: 255
    assert_error @customer, :address, :too_long, count: 255
  end
end
