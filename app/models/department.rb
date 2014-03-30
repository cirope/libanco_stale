class Department < ActiveRecord::Base
  include Attributes::Strip
  include Departments::Validation

  strip_fields :name

  belongs_to :organization

  def to_s
    name
  end
end
