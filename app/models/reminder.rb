class Reminder < ActiveRecord::Base
  include Auditable
  include Reminders::Validation
  include Reminders::Delivery
  include Reminders::DestroyConstraints

  delegate :email, to: :user, prefix: true
  delegate :scheduled_at, :description, to: :schedule

  default_scope -> { order("#{table_name}.remind_at ASC") }

  belongs_to :schedule
  has_one :user, through: :schedule
end
