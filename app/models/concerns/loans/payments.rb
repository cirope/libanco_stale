module Loans::Payments
  extend ActiveSupport::Concern

  included do
    has_many :payments, dependent: :destroy

    before_create :create_payments, :assign_loan_attributes
  end

  def total_debt
    unpaid_payments_count * payment
  end

  def unpaid_payments_count
    payments.where(paid_at: nil).count
  end

  private

    def create_payments
      expired_at = Date.today

      (1..payments_count).each do |number|
        expired_at = expired_at.next_month

        payments.build(number: number, expired_at: expired_at)
      end
    end

    def assign_loan_attributes
      self.expired_at = payments.last.expired_at
      self.payment = payment_amount
    end

    def payment_amount
      interest_rate = PAYMENTS_DATA[payments_count]

      (amount * interest_rate) / payments_count
    end
end
