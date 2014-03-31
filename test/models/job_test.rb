require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    @job = jobs(:one)
  end

  test 'blank attributes' do
    @job.attr = ''

    assert @job.invalid?
    assert_error @job, :attr, :blank
  end

  test 'unique attributes' do
    @job.attr = jobs(:two).attr

    assert @job.invalid?
    assert_error @job, :attr, :taken
  end
end
