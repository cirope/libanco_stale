class Schedule < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Schedules::Validation
  include Schedules::Scopes
  include Schedules::Schedulable

  strip_fields :description

  after_initialize :set_default_datetime

  belongs_to :user

  def set_default_datetime
    self.scheduled_at ||= Schedule.min_datetime
  end
end
