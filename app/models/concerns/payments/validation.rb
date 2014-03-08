module Payments::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, :expired_at, :loan, presence: true
  end
end
