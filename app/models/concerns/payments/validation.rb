module Payments::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, :expire_at, :payment, :loan, presence: true
  end
end
