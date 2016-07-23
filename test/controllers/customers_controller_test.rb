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

  test 'should get new private' do
    get :new
    assert_response :success
  end

  test 'should create private customer' do
    assert_difference ['Customer.count', 'Phone.count'] do
      post :create, customer: {
        name: @customer.name,
        lastname: @customer.lastname,
        identification: '27988345',
        tax_id: '20-27988345-3',
        email: 'paul@skanska.com',
        address: @customer.address,
        city_id: @customer.city.id,
        marital_status: @customer.marital_status,
        spouse_name: @customer.spouse_name,
        education_level: @customer.education_level,
        birthdate: @customer.birthdate,
        profession: @customer.profession,
        work_address: @customer.work_address,
        monthly_income: @customer.monthly_income,
        nacionality_id: @customer.nacionality_id,
        phones_attributes: [
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
    patch :update, id: @customer, customer: { name: 'Updated value' }
    assert_redirected_to customer_url(assigns(:customer))
  end
end
