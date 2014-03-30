module Rates::Validation
  extend ActiveSupport::Concern

  included do
    validates :payments_count, :rate, presence: true,
      numericality: { greater_than: 0 }
    validates :payments_count, uniqueness: { scope: :rate_set_id }
  end
end
