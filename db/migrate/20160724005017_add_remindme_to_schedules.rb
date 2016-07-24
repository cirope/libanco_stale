class AddRemindmeToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :remind_me, :boolean, null: false, default: false
  end
end
