class State < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Attributes::Titleize
  include Auditable
  include States::Scopes
  include States::Validation

  strip_fields :name
  titleize_fields :name

  has_many :cities, -> { order('name') }, dependent: :destroy

  def to_s
    name
  end
end
