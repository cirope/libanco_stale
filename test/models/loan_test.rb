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
    assert_error @loan, :job, :blank
    assert_error @loan, :user, :blank
  end

  test 'attributes boundaries' do
    @loan.amount = -1

    assert @loan.invalid?
    assert_error @loan, :amount, :greater_than, count: 0
  end

  test 'should set history status to loan when create a new' do
    Account.current_id = accounts(:cirope).id

    customer = @loan.customer
    assert @loan.update_column(:status, 'canceled')

    assert_equal 0, customer.loans.history.count

    assert Loan.create!(
      amount: 10000, rate_id: rates(:rate_1).id, customer: customer, user_id: @loan.user_id
    )

    assert_equal 1, customer.loans.reload.history.count
  end

  test 'should set expired status to loan' do
    Account.current_id = accounts(:cirope).id

    assert_equal 'current', @loan.status
    assert @loan.payments.first.update!(expire_at: 1.month.ago, paid_at: '')

    assert_equal 'expired', @loan.reload.status
  end
end
