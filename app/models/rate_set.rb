class RateSet < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Validations::Name
  include RateSets::Rates
end
