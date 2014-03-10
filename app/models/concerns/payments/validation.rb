module Payments::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, :expired_at, :payment, :loan, presence: true
  end
end
