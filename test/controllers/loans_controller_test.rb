require 'test_helper'

class LoansControllerTest < ActionController::TestCase
  include LoansTestHelper

  setup do
    @loan = loans(:first_loan)

    login
  end

  test 'should get index' do
    @loan.destroy
    loans = create_loans 2.months.ago, 2.months.from_now

    get :index
    assert_response :success
    assert_equal 5, loans.size
    assert_equal assigns(:loans).size, assigns(:summary).count
    assert_equal assigns(:loans).map(&:amount).sum, assigns(:summary).amount
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
    assert_difference('Loan.count') do
      assert_difference('Payment.count', 12) do
        xhr :post, :create, customer_id: customers(:paul).id, loan: {
          amount: 10000, rate_id: rates(:rate_1).id
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
