set :environment, 'production'

every 5.minutes do
  rake 'reminders:send'
end

every 1.day, at: '18:00' do
  rake 'reminders:send_summaries'
end

every 1.day, at: '00:01' do
  rake 'payments:assign_current_taxes'
end
