class Schedule < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Schedules::Validation
  include Schedules::Scopes
  include Schedules::Reminders
  include Schedules::Schedulable
  include Schedules::Done

  strip_fields :description

  belongs_to :user
  has_many :reminders, dependent: :destroy

  def move(date)
    update(
      :scheduled_at, scheduled_at.change(
        year: date.year, month: date.month, day: date.day
      )
    )
  end
end
