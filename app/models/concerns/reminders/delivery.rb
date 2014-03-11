module Reminders::Delivery
  extend ActiveSupport::Concern

  included do
    scope :upcoming, -> {
      includes(:schedule).where(
        [
          "#{table_name}.remind_at <= :date",
          "#{table_name}.scheduled  = :false",
          "#{Schedule.table_name}.done = :false"
        ].join(' AND '),
        { date: 5.minutes.from_now, false: false }
      ).references(:schedule)
    }
  end

  module ClassMethods
    def send_reminders
      unscoped.upcoming.find_each do |reminder|
        reminder.update_attributes! scheduled: true

        ReminderWorker.perform_at(reminder.remind_at, reminder.id)
      end
    end

    def send_summaries
      User.find_each do |user|
        Notifier.delay.summary(user) if user.schedules.for_tomorrow.count > 0
      end
    end
  end
end
