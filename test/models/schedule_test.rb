require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  def setup
    @schedule = schedules(:first_schedule)
  end

  test 'blank attributes' do
    @schedule = Schedule.new(description: '')

    assert @schedule.invalid?
    assert_error @schedule, :description, :blank
    assert_error @schedule, :scheduled_at, :blank
    assert_error @schedule, :user, :blank
  end
end
