module Reminders::Delivery
  extend ActiveSupport::Concern

  included do
    scope :upcoming, -> {
      where(
        [
          "#{table_name}.remind_at <= :date",
          "#{table_name}.scheduled = :false",
        ].join(' AND '),
        { date: 5.minutes.from_now, false: false }
      )
    }
  end

  module ClassMethods
    def send_reminders
      unscoped.upcoming.find_each do |reminder|
        Schedule.unscoped do
          unless reminder.schedule.done
            reminder.update_attributes! scheduled: true

            ReminderWorker.perform_at(reminder.remind_at, reminder.id)
          end
        end
      end
    end

    def send_summaries
      Schedule.unscoped do
        User.unscoped.find_each do |user|
          SummaryWorker.perform_at(user.name, user.id) if user.schedules.for_tomorrow.count > 0
        end
      end
    end
  end
end
