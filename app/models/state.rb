class State < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include States::Scopes
  include States::Validation

  strip_fields :name

  def to_s
    name
  end
end
