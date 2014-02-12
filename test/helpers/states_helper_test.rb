require 'test_helper'

class StatesHelperTest < ActionView::TestCase
  test 'states' do
    assert_respond_to states, :each
  end

  test 'states and cities' do
    states = states_and_cities

    assert_respond_to states, :each
    assert_respond_to states.first, :cities
  end

  test 'render city list' do
    @state = State.joins(:cities).take

    assert_match /<ul/, render_city_list
  end

  test 'should not render city list' do
    @state = State.new

    assert render_city_list.blank?
  end
end
