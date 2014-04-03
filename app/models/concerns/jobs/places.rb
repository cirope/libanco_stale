module Jobs::Places
  extend ActiveSupport::Concern

  included do
    belongs_to :place, polymorphic: true

    delegate :name, :phones, to: :place, allow_nil: true
  end
end
