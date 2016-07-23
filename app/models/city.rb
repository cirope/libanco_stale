class City < ActiveRecord::Base
  include Attributes::Strip
  include Auditable
  include Cities::Validation

  scope :ordered, -> { order("#{table_name}.name") } 

  strip_fields :name, :zip_code

  belongs_to :state

  def to_s
    name
  end
end
