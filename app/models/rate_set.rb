class RateSet < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include RateSets::Validation
  include RateSets::Rates

  scope :ordered, -> { order('name ASC') }

  strip_fields :name

  def to_s
    name
  end
end
