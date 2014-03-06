json.default_date l @current_date, format: :calendar
json.scheduled_days @scheduled_month
json.today l Date.today, format: :calendar
