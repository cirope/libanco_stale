require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

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

  test 'remind me' do
    @schedule = Schedule.create!(
      user: users(:john), scheduled_at: 1.hour.from_now, description: 'description'
    )

    @schedule.remind_me = true
    @schedule.save

    assert_no_difference '@schedule.reminders.count' do
      @schedule.move(5.days.from_now)
      assert @schedule.reminders.reload.all? do |s|
        s.remind_at == (@schedule.scheduled_at - @schedule.delay)
      end
    end
  end

  test 'allow remind me' do
    assert @schedule.allow_remind_me?

    @schedule.reminders.clear
    @schedule.scheduled_at = 1.minute.ago

    assert !@schedule.allow_remind_me?

    @schedule.scheduled_at = 1.minute.from_now
    assert @schedule.allow_remind_me?
  end

  test 'move schedules' do
    date = 5.days.from_now
    @schedule.move(date)

    assert_equal date.to_date, @schedule.reload.scheduled_at.to_date
  end
end
