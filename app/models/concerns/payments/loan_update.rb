module Payments::LoanUpdate
  extend ActiveSupport::Concern

  included do
    before_save :update_loan_status, on: :update
  end

  private
    def update_loan_status
      loan.progress = percentage_progress
      loan.canceled_at = payments_dates.max if canceled?
      loan.status = 'canceled' if canceled?
    end

    def self_and_siblings
      @_payments ||= loan.payments.map { |payment| payment.id == id ? self : payment }
    end

    def percentage_progress
      ((paid_payments_count * 100) / loan.payments_count.to_f).round
    end

    def paid_payments_count
      payments_dates.compact.count
    end

    def payments_dates
      self_and_siblings.map(&:paid_at)
    end

    def canceled?
      @_canceled ||= (paid_payments_count == loan.payments_count)
    end
end
