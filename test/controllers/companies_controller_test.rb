require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase

  setup do
    @company = companies(:skanska)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create company' do
    assert_difference('Company.count') do
      post :create, company: {
        name: 'empresa',
        address: 'direccion',
        tax_id: '20-275643345-3',
        company_phones_attributes: [
          { phone: '261-4286544' }
        ]
      }
    end

    assert_redirected_to company_url(assigns(:company))
  end

  test 'should show company' do
    get :show, id: @company
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @company
    assert_response :success
  end

  test 'should update company' do
    patch :update, id: @company, company: { name: 'value' }
    assert_redirected_to company_url(assigns(:company))
  end

  test 'should destroy company' do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
