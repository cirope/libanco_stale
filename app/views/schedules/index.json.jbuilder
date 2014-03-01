json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :description, :scheduled_at, :done, :user_id
  json.url schedule_url(schedule, format: :json)
end
