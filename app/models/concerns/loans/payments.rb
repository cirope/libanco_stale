module Loans::Payments
  extend ActiveSupport::Concern

  included do
    has_many :payments, dependent: :destroy, counter_cache: ''

    before_create :create_payments, :assign_loan_attributes
  end

  def paid_payments_count
    payments.where.not(paid_at: nil).count
  end

  def total_debt
    payments.where(paid_at: nil).sum('payment')
  end

  private

    def create_payments
      expiration = first_expiration

      (1..payments_count).each do |number|
        payments.build(
          number: number,
          payment: payment_amount,
          expire_at: expiration_corrector(expiration)
        )
        expiration = expiration.next_month
      end
    end

    def first_expiration
      today = Date.today
      months = [1..14].include?(today.mday) ? 1 : 2

      Date.new(today.year, today.mon, 10).next_month(months)
    end

    def expiration_corrector(expiration)
      case expiration.wday
        when 6 then expiration.next_day(2) # Saturday
        when 0 then expiration.next_day    # Sunday
        else expiration
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
