class Department < ActiveRecord::Base
  include Phonable
  include Attributes::Strip
  include Departments::Validation

  strip_fields :name

  scope :ordered, -> { order("#{table_name}.name") }

  belongs_to :organization

  def to_s
    name
  end

  def label
    [name, organization.to_s].join(', ')
  end
end
