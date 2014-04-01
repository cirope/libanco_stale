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
end
