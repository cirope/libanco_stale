module Phones::Validation
  extend ActiveSupport::Concern

  included do
    validates :phone, length: { maximum: 255 }, presence: true
    validates :phone, uniqueness: { scope: :phonable_id }
  end
end
