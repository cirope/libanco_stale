class Organization < ActiveRecord::Base
  include Auditable
  include Attributes::Strip
  include Organizations::Departments
  include Organizations::Validation

  scope :ordered, -> { order("#{table_name}.name") }

  strip_fields :name

  def to_s
    name
  end
end
