set :environment, 'production'

every 5.minutes do
  rake 'reminders:send'
end

every 1.day, at: '18:00' do
  rake 'reminders:send_summaries'
end
