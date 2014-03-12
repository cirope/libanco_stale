class ReminderWorker
  include Sidekiq::Worker

  def perform(reminder_id)
    Schedule.unscoped do
      User.unscoped do
        reminder = Reminder.find reminder_id

        Reminder.transaction do
          reminder.update_column :notified, true
          Notifier.remind(reminder).deliver
        end
      end
    end
  end
end
