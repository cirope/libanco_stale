class City < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Attributes::Titleize
  include Auditable
  include Cities::Validation

  strip_fields :name, :zip_code
  titleize_fields :name

  belongs_to :state

  def to_s
    name
  end
end
