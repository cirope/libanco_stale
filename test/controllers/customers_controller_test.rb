require 'test_helper'

class CustomersControllerTest < ActionController::TestCase

  setup do
    @customer = customers(:paul)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test 'should get only customer in search' do
    get :index, q: '33216329'
    assert_response :success
    assert_equal 1, assigns(:customers).size
  end

  test 'should show customer' do
    get :show, id: @customer
    assert_response :success
  end
end
