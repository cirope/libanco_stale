module Loans::Rates
  extend ActiveSupport::Concern

  included do
    attr_accessor :rate_id, :rate_set_id

    before_validation :set_payments_count, on: :create
  end

  private

    def rate
      @rate ||= Rate.find_by(id: rate_id)
    end

    def set_payments_count
      self.payments_count = rate.payments_count if rate
    end
end
