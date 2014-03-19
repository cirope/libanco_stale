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

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create customer' do
    assert_difference('Customer.count') do
      post :create, customer: {
        name: @customer.name,
        lastname: @customer.lastname,
        identification: '27988345',
        tax_id: '20-27988345-3',
        email: 'paul@skanska.com',
        address: @customer.address,
        city_id: @customer.city_id,
        customer_phones_attributes: [
          { phone: '261-4286544' }
        ]
      }
    end

    assert_redirected_to customer_url(assigns(:customer))
  end

  test 'should show customer' do
    get :show, id: @customer
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @customer
    assert_response :success
  end

  test 'should update customer' do
    patch :update, id: @customer, customer: { name: 'Updated name' }
    assert_redirected_to customer_url(assigns(:customer))
  end

  test 'should destroy customer' do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
