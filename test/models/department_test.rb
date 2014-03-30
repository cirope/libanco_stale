require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  def setup
    @department = departments(:police)
  end

  test 'blank attributes' do
    @department.name = ''

    assert @department.invalid?
    assert_error @department, :name, :blank
  end

  test 'unique attributes' do
    @department.name = departments(:health).name

    assert @department.invalid?
    assert_error @department, :name, :taken
  end

  test 'attributes length' do
    @department.name = 'abcde' * 52

    assert @department.invalid?
    assert_error @department, :name, :too_long, count: 255
  end
end
