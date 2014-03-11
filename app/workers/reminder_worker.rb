class ReminderWorker
  include Sidekiq::Worker

  def perform(reminder_id)
    reminder = Reminder.find reminder_id

    Reminder.transaction do
      reminder.update_attributes! notified: true
      Notifier.remind(reminder).deliver
    end
  end
end
