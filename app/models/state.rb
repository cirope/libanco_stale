class State < ActiveRecord::Base
  include Attributes::Strip
  include Auditable
  include States::Scopes
  include Validations::Name

  has_many :cities, -> { order('name') }, dependent: :destroy
end
