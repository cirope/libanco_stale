require 'test_helper'

class CitiesTest < ActionDispatch::IntegrationTest
  test 'add state' do
    login

    visit new_city_path

    find("a[href='#{new_state_path}']").click

    assert page.has_css?('#modal')

    within '#modal form' do
      fill_in 'state_name', with: 'San Juan'
    end

    assert_difference 'State.count' do
      find('#modal .btn.btn-primary').click
      assert page.has_no_css?('#modal')
    end

    assert page.has_css?('select[name$="[state_id]"] option[selected]', text: 'San Juan')
  end
end
