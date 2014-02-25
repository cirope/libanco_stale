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
end
