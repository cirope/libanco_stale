module Jobs::Places
  extend ActiveSupport::Concern

  included do
    belongs_to :place, polymorphic: true

    delegate :name, :phones, :label, to: :place, allow_nil: true
  end
end
