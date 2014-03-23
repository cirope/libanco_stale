require 'test_helper'

class PrivateCustomersControllerTest < ActionController::TestCase

  setup do
    @private_customer = private_customers(:private_customer)

    login
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create private_customer' do
    assert_difference ['PrivateCustomer.count', 'Customer.count'] do
      post :create, private_customer: {
        company_id: companies(:skanska).id,
        customer_attributes: {
          name: @private_customer.name,
          lastname: @private_customer.lastname,
          identification: '27988345',
          tax_id: '20-27988345-3',
          email: 'paul@skanska.com',
          address: @private_customer.address,
          city_id: @private_customer.city.id,
          phones_attributes: [
            { phone: '261-4286544' }
          ]
        }
      }
    end

    assert_redirected_to customer_url(assigns(:private_customer).customer)
  end

  test 'should get edit' do
    get :edit, id: @private_customer
    assert_response :success
  end

  test 'should update private_customer' do
    patch :update, id: @private_customer, private_customer: {
      customer_attributes: { id: @private_customer.customer.id, name: 'Updated name' }
    }
    assert_redirected_to customer_url(assigns(:private_customer).customer)
  end
end
