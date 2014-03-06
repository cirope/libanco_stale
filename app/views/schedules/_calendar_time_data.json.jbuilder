json.default_date l @schedule.scheduled_at.to_date
json.hour @schedule.scheduled_at.hour
json.min @schedule.scheduled_at.min
json.min_date_time l Schedule.min_datetime, format: :datetime
