require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase

  setup do
    @payment = payments(:first_payment)
    @loan = @payment.loan

    login
  end

  test 'should get index' do
    get :index, loan_id: @loan.id
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test 'should get edit' do
    xhr :get, :edit, id: @payment, loan_id: @loan.id
    assert_response :success
  end

  test 'should update payment' do
    xhr :patch, :update, id: @payment,
      loan_id: @loan.id, payment: { paid_at: 1.month.from_now }
    assert_response :success
  end
end
