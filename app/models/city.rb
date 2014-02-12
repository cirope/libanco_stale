class City < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Cities::Validation

  strip_fields :name, :zip_code

  belongs_to :state

  def to_s
    name
  end
end
