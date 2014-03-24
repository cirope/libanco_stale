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
    assert_redirected_to customer_url(assigns(:customers).first)
  end

  test 'should get customers in search' do
    get :index, q: 's'
    assert_equal 2, assigns(:customers).size
  end

  test 'should show private customer' do
    get :show, id: private_customers(:private_customer).customer
    assert_response :success
  end

  test 'should show public customer' do
    get :show, id: public_customers(:public_customer).customer
    assert_response :success
  end
end
