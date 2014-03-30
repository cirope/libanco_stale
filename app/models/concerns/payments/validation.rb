module Payments::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, :expire_at, :payment, presence: true
  end
end
