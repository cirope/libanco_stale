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

  test 'mark as done' do
    assert !@schedule.done
    assert @schedule.mark_as_done!
  end

  test 'can not set to undone if in the past' do
    assert @schedule.mark_as_done!
    assert @schedule.done
    assert @schedule.update_column(:scheduled_at, 1.minute.ago)
    assert !@schedule.mark_as_done!
    assert @schedule.reload.done
  end

  test 'doable' do
    assert @schedule.doable?
    assert @schedule.mark_as_done!
    assert @schedule.doable?
    assert @schedule.update_column(:scheduled_at, 1.minute.ago)
    assert !@schedule.doable?
  end

  test 'past' do
    @schedule.scheduled_at = 1.minute.from_now
    assert !@schedule.past?

    @schedule.scheduled_at = 1.minute.ago
    assert @schedule.past?
  end

  test 'editable?' do
    assert @schedule.editable?

    @schedule.mark_as_done!
    assert !@schedule.editable?

    @schedule.scheduled_at = 1.minute.ago
    assert !@schedule.editable?
  end
end
