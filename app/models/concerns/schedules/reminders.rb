module Schedules::Reminders
  extend ActiveSupport::Concern

  included do
    before_save :build_reminder
    after_update :update_reminder
  end

  def remind_me_default_value
    new_record? && remind_me.nil? || reminders.present?
  end

  def allow_remind_me?
    new_record? || !past? && reminders.all?(&:allow_destruction?)
  end

  module ClassMethods
    def for_tomorrow
      where(scheduled_at: (Date.tomorrow.at_beginning_of_day..Date.tomorrow.at_end_of_day))
    end
  end

  private

    def build_reminder
      if build_reminder?
        reminders.build(remind_at: scheduled_at - delay, kind: 'email')
      elsif remove_reminder?
        reminders.clear
      end
    end

    def build_reminder?
      remind_me && reminders.blank?
    end

    def remove_reminder?
      !remind_me
    end

    def update_reminder
      reminders.each do |reminder|
        reminder.update(
          remind_at: (scheduled_at - delay), scheduled: false, notified: false
        ) if scheduled_at_changed?
      end
    end

    def delay
      15.minutes
    end
end
