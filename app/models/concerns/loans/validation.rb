module Loans::Validation
  extend ActiveSupport::Concern

  included do
    validates :customer, :user, presence: true
    validates :amount, numericality: { greater_than: 0 }, presence: true
    validates :payments_count, inclusion: { in: PAYMENTS_DATA.keys },
      presence: true
  end
end
