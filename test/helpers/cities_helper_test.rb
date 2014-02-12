require 'test_helper'

class CitiesHelperTest < ActionView::TestCase
  test 'state label' do
    label = state_label

    assert_kind_of String, label
    assert_match /<a .*>/, label
  end
end
