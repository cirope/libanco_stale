module States::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order("#{table_name}.name") }
  end
end
