class Nacionality < ActiveRecord::Base
  include Attributes::Strip
  include Nacionalities::Validation

  strip_fields :name

  default_scope -> { order 'name ASC' }

  def to_s
    name
  end
end
