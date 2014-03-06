require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  def setup
    @schedule = schedules(:first_schedule)
  end

  test 'blank attributes' do
    @schedule = Schedule.new(description: '')
    @schedule.scheduled_at = nil

    assert @schedule.invalid?
    assert_error @schedule, :description, :blank
    assert_error @schedule, :scheduled_at, :blank
    assert_error @schedule, :user, :blank
  end

  test 'validates date attributes' do
    @schedule.scheduled_at = 1.hour.ago

    assert @schedule.invalid?
    assert_error @schedule, :scheduled_at, :on_or_after,
      restriction: I18n.l(Time.zone.now, format: :minimal)
  end
end
