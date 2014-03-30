class Organization < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Organizations::Departments
  include Organizations::Validation

  strip_fields :name

  def to_s
    name
  end
end
