module Loans::Validation
  extend ActiveSupport::Concern

  included do
    validates :payments_count, :job, :user, presence: true
    validates :rate_id, presence: true, on: :create
    validates :amount, numericality: { greater_than: 0 }, presence: true
  end
end
