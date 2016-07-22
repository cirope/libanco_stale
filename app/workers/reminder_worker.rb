class ReminderWorker
  include Sidekiq::Worker

  def perform(reminder_id)
    reminder = Reminder.find reminder_id
    Schedule.unscoped do
      Account.current_id = reminder.account.id
    end

    Reminder.transaction do
      reminder.update_column :notified, true
      Notifier.remind(reminder).deliver_later
    end
  end
end
