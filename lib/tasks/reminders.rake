namespace :reminders do
  desc 'Send email reminders'
  task send: :environment do
    ::Reminder.send_reminders
  end
  desc 'Send email summaries'
  task send_summaries: :environment do
    ::Reminder.send_summaries
  end
end
