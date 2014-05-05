require 'test_helper'

class CustomersTest < ActionDispatch::IntegrationTest
  test 'should load companies in select' do
    login

    visit new_customer_path

    assert page.has_selector? 'select[data-place-id][disabled]'
    select I18n.t('customers.jobs.private')
    assert page.has_no_selector?('select[data-place-id][disabled]')

    # Blank value in select with prompt leyend
    assert_equal Company.count + 1, all('select[data-place-id] option').size
    assert_equal 'Company', find('[data-place-type]', visible: false).value
  end

  test 'should load departments in grouped select' do
    login

    visit new_customer_path

    assert page.has_selector? 'select[data-place-id][disabled]'
    select I18n.t('customers.jobs.public')
    assert page.has_no_selector?('select[data-place-id][disabled]')

    # Blank value in select with prompt leyend
    assert_equal Organization.count + 1, all('select[data-place-id] option').size
    assert_equal 'Department', find('[data-place-type]', visible: false).value
  end
end
