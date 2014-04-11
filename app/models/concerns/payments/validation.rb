module Payments::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, :expire_at, :payment, presence: true
    validates_date :paid_at, allow_blank: true
  end
end
