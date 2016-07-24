class Reminder < ActiveRecord::Base
  include Auditable
  include CurrentAccount
  include Reminders::Validation
  include Reminders::Delivery
  include Reminders::DestroyConstraints
  include Reminders::Relations

  delegate :email, to: :user, prefix: true
  delegate :scheduled_at, :description, :schedulable, to: :schedule

  default_scope -> { order("#{table_name}.remind_at ASC") }
end
