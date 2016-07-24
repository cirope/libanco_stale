namespace :reminders do
  desc 'Send email reminders'
  task send: :environment do
    Account.all.each do |account|
      Apartment::Tenant.switch! account.subdomain
      ::Reminder.send_reminders
    end
  end

  desc 'Send email summaries'
  task send_summaries: :environment do
    Account.all.each do |account|
      Apartment::Tenant.switch! account.subdomain
      ::Reminder.send_summaries
    end
  end
end
