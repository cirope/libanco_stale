require 'test_helper'

class StateTest < ActiveSupport::TestCase
  def setup
    @state = states :mendoza
  end

  test 'blank attributes' do
    @state.name = ''
    @state.account = nil

    assert @state.invalid?
    assert_error @state, :name, :blank
    assert_error @state, :account, :blank
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

  test 'attributes titleize' do
    @state.name = 'nEw sTatE'

    assert @state.valid?
    assert_equal @state.name, 'New State'
  end
end
