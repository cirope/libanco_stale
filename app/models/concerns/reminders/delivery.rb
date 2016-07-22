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
            reminder.update_column :scheduled, true
				
						Schedule.unscoped do
							Account.current_id = reminder.account.id
						end   
						
						Reminder.transaction do
							reminder.update_column :notified, true
							Notifier.remind(reminder).deliver_later
						end
          end
        end
      end
    end

    def send_summaries
      Schedule.unscoped do
        User.unscoped.find_each do |user|
				  user = User.find user_id

          if user.schedules.for_tomorrow.count > 0
            Account.current_id = user.account.id

            Reminder.transaction do
              Notifier.summary(user).deliver_later
            end
          end
        end
			end
    end
  end
end
