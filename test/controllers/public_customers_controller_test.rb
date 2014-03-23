require 'test_helper'

class PublicCustomersControllerTest < ActionController::TestCase

  setup do
    @public_customer = public_customers(:public_customer)

    login
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create public_customer' do
    assert_difference ['PublicCustomer.count', 'Customer.count'] do
      post :create, public_customer: {
        department: 'Department',
        division: 'Division',
        customer_attributes: {
          name: @public_customer.name,
          lastname: @public_customer.lastname,
          identification: '27988345',
          tax_id: '20-27988345-3',
          email: 'simon@skanska.com',
          address: @public_customer.address,
          city_id: @public_customer.city.id,
          phones_attributes: [
            { phone: '261-4286544' }
          ]
        }
      }
    end

    assert_redirected_to customer_url(assigns(:public_customer).customer)
  end

  test 'should get edit' do
    get :edit, id: @public_customer
    assert_response :success
  end

  test 'should update public_customer' do
    patch :update, id: @public_customer, public_customer: {
      customer_attributes: { id: @public_customer.customer.id, name: 'Updated name' }
    }
    assert_redirected_to customer_url(assigns(:public_customer).customer)
  end
end
