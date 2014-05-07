require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    @job = jobs(:private)
  end

  test 'blank attributes' do
    @job = Job.new(kind: '')

    assert @job.invalid?
    assert_error @job, :kind, :blank
  end

  test 'attributes inclusion' do
    @job.kind = 'kind'

    assert @job.invalid?
    assert_error @job, :kind, :inclusion
  end

  test 'invalid date' do
    @job.joining_at = '1234abc'

    assert @job.invalid?
    assert_error @job, :joining_at, :invalid_date
  end
end
