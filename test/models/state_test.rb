require 'test_helper'

class StateTest < ActiveSupport::TestCase
  def setup
    @state = states :mendoza
  end

  test 'blank attributes' do
    @state.name = ''

    assert @state.invalid?
    assert_error @state, :name, :blank
  end

  test 'unique attributes' do
    state = @state.dup

    assert state.invalid?
    assert_error state, :name, :taken
  end

  test 'attributes length' do
    @state.name = 'abcde' * 52

    assert @state.invalid?
    assert_error @state, :name, :too_long, count: 255
  end
end
