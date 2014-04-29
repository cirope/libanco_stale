module Validations::Name
  extend ActiveSupport::Concern

  included do
    strip_fields :name

    scope :ordered, -> { order("#{table_name}.name") }

    validates :name,
      presence:   true,
      length:     { maximum: 255 },
      uniqueness: { case_sensitive: false, scope: :account_id }
  end

  def to_s
    name
  end
  alias_method :label, :to_s
end
