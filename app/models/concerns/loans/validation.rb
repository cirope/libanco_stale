module Loans::Validation
  extend ActiveSupport::Concern

  included do
    validates :payments_count, :customer, :user, :rate_id, presence: true
    validates :amount, numericality: { greater_than: 0 }, presence: true
  end
end
