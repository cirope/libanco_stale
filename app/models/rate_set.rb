class RateSet < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include RateSets::Validation

  strip_fields :name

  def to_s
    name
  end
end
