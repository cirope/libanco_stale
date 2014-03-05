require 'test_helper'

class LoansControllerTest < ActionController::TestCase

  setup do
    @loan = loans(:first_loan)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:loans)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create loan' do
    assert_difference('Loan.count') do
      post :create, loan: {
        amount: 10000,
        payments_count: 18,
        customer_id: customers(:paul).id
      }
    end

    assert_redirected_to loan_url(assigns(:loan))
  end

  test 'should show loan' do
    get :show, id: @loan
    assert_response :success
  end
end