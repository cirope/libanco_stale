class Schedule < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Schedules::Validation
  include Schedules::Scopes

  strip_fields :description

  belongs_to :user
  belongs_to :schedulable, polymorphic: true
end
