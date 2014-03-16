module Loans::Payments
  extend ActiveSupport::Concern

  included do
    has_many :payments, dependent: :destroy, counter_cache: ''

    before_create :create_payments, :assign_loan_attributes
  end

  def total_debt
    payments.where(paid_at: nil).sum('payment')
  end

  private

    def create_payments
      expiration = (expire_at || Date.today)

      (1..payments_count).each do |number|
        expiration = expiration.next_month

        payments.build(
          number: number,
          payment: payment_amount,
          expire_at: expiration
        )
      end
    end

    def assign_loan_attributes
      self.expire_at = payments.map(&:expire_at).max
      self.next_payment_expire_at = payments.map(&:expire_at).min
    end

    def payment_amount
      interest_rate = PAYMENTS_DATA[payments_count]

      (amount * interest_rate) / payments_count
    end
end
