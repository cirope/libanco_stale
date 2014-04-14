require 'test_helper'

class LoansTest < ActionDispatch::IntegrationTest
  test 'create loan' do
    login

    payments_count = 12
    visit customer_path(customers(:paul))
    find('.btn.btn-primary').click

    within '#modal form' do
      select rate_sets(:private_rate_set).name, from: 'loan_rate_set_id'

      assert page.has_css?('table')

      fill_in 'loan_amount', with: '1000'
      select payments_count, from: 'loan_rate_id'
    end

    assert_difference 'Loan.count' do
      assert_difference 'Payment.count', payments_count do
        find('#modal .btn.btn-primary').click
        assert page.has_no_css?('#modal')
      end
    end
  end

  test 'show loan info' do
    login

    visit loans_path
    loan = loans(:first_loan)

    assert page.has_css?('table.table')

    find("a[href='#{loans_path(loan)}']").click

    assert page.has_css?('.panel.panel-loan-info')
  end
end
