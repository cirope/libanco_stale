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

  test 'should get index with filter' do
    assert_generates loans_path(filter: 'expired'),
      { controller: 'loans', action: 'index', filter: 'expired' }
  end

  test 'should get new' do
    get :new, customer_id: customers(:paul).id
    assert_response :success
  end

  test 'should create loan' do
    payments_count = 12

    assert_difference('Loan.count') do
      assert_difference('Payment.count', payments_count) do
        xhr :post, :create, customer_id: customers(:paul).id, loan: {
          amount: 10000, payments_count: payments_count
        }
      end
    end

    assert_response :success
  end

  test 'should show loan' do
    xhr :get, :show, id: @loan
    assert_response :success
  end
end
