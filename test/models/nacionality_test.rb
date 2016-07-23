require 'test_helper'

class NacionalityTest < ActiveSupport::TestCase
  def setup
    @nacionality = nacionalities :default
  end

  test 'blank attributes' do
    @nacionality.name = ''

    assert @nacionality.invalid?
    assert_error @nacionality, :name, :blank
  end

  test 'unique attributes' do
    @nacionality.name = nacionalities(:iso).name

    assert @nacionality.invalid?
    assert_error @nacionality, :name, :taken
  end
end
