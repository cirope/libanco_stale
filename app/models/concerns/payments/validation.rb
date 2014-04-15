module Payments::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, :expire_at, :payment, presence: true
    validates :paid_at, timeliness: { type: :date }, allow_blank: true
  end
end
