set :environment, 'production'

every 5.minutes do
  rake 'reminders:send'
end

every 1.day, at: '18:00' do
  rake 'reminders:send_summaries'
end

every 1.month, at: 'start of the month at 00:01am'
  rake 'customers:assign_taxes'
end
