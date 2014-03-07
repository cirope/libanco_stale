module Payments::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, :expired_at, :loan, presence: true
    validates :paid_at, presence: true, on: :update
  end
end
