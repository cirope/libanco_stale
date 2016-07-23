class Company < ActiveRecord::Base
  include Auditable
  include Attributes::Strip
  include Phonable
  include Validations::Name
end
