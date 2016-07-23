class RateSet < ActiveRecord::Base
  include Auditable
  include Attributes::Strip
  include Validations::Name
  include RateSets::Rates
end
