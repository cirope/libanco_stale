class Company < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Phonable
  include Companies::Validation

  strip_fields :name

  scope :ordered, -> { order("#{table_name}.name") }

  def to_s
    name
  end
end
