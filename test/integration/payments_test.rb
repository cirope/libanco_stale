require 'test_helper'

class PaymentsTest < ActionDispatch::IntegrationTest
  test 'should paid payment' do
    login

    loan = loans(:first_loan)
    payment = loan.payments.first
    assert payment.update(paid_at: nil, expire_at: Date.yesterday.to_s(:db))

    visit loans_path

    assert page.has_css?('table.table')
    find("a[href='#{loans_path(loan)}']").click
    assert page.has_css?('.panel.panel-loan-info')

    within "tr[data-payment='#{payment.id}']" do
      assert page.has_css?('span.label.label-danger')
      find("a[href='#{edit_payment_path(payment)}']").click
    end

    assert page.has_css?('#modal')

    within 'div.ui-datepicker' do
      find('td.ui-datepicker-today a').click
      assert page.has_no_css?('.ui-datepicker')
    end

    within '#modal' do
      find('.btn.btn-primary').click
    end

    assert page.has_no_css?('#modal')

    within "tr[data-payment='#{payment.id}']" do
      assert page.has_no_css?('span.label.label-danger')
    end
  end
end
