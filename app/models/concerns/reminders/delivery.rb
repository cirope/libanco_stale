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
      upcoming.find_each do |reminder|
        if !reminder.schedule.done
          reminder.update_column :scheduled, true
      
          Reminder.transaction do
            reminder.update_column :notified, true
            Notifier.remind(reminder).deliver_later
          end
        end
      end
    end

    def send_summaries
      User.all.find_each do |user|
        if user.schedules.for_tomorrow.count > 0
          Reminder.transaction do
            Notifier.summary(user).deliver_later
          end
        end
      end
    end
  end
end
