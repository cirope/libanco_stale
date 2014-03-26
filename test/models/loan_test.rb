require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  def setup
    @loan = loans(:first_loan)
  end

  test 'blank attributes' do
    @loan = Loan.new(amount: '', payments_count: '')

    assert @loan.invalid?
    assert_error @loan, :amount, :blank
    assert_error @loan, :payments_count, :blank
    assert_error @loan, :customer, :blank
    assert_error @loan, :user, :blank
  end

  test 'attributes boundaries' do
    @loan.amount = -1

    assert @loan.invalid?
    assert_error @loan, :amount, :greater_than, count: 0
  end

  test 'attributes inclusion' do
    @loan.payments_count = 36

    assert @loan.invalid?
    assert_error @loan, :payments_count, :inclusion
  end

  test 'should update status' do
    Account.current_id = accounts(:cirope).id

    customer = @loan.customer
    assert @loan.update_column(:status, 'canceled')

    assert_equal 0, customer.loans.history.count

    assert customer.loans.create(
      amount: 10000, payments_count: 12, user_id: @loan.user_id
    )

    assert_equal 1, customer.loans.reload.history.count
  end
end
