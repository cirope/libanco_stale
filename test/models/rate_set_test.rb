require 'test_helper'

class RateSetTest < ActiveSupport::TestCase
  def setup
    @rate_set = rate_sets(:private_rate_set)
  end

  test 'blank attributes' do
    @rate_set.name = ''

    assert @rate_set.invalid?
    assert_error @rate_set, :name, :blank
  end

  test 'unique attributes' do
    @rate_set.name = rate_sets(:public_rate_set).name

    assert @rate_set.invalid?
    assert_error @rate_set, :name, :taken
  end

  test 'attributes length' do
    @rate_set.name = 'abcde' * 52

    assert @rate_set.invalid?
    assert_error @rate_set, :name, :too_long, count: 255
  end
end
