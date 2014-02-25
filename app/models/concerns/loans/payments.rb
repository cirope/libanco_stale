module Loans::Payments
  extend ActiveSupport::Concern

  included do
    has_many :payments, dependent: :destroy

    after_create :create_payments, :update_values
  end

  private

    def create_payments
      start_date = Date.today

      (1..payments_count).each do |number|
        payments.create!(
          number: number,
          expired_at: payment_expired_at(start_date, number)
        )
      end
    end

    def update_values
      update(
        payment: calculate_payment_amount,
        expired_at: payment_expired_at(Date.today, payments_count)
      )
    end

    def calculate_payment_amount
      interest_rate = PAYMENTS_COUNT[payments_count]

      (amount * interest_rate) / payments_count
    end

    def payment_expired_at(start_date, number)
      start_date + number.months
    end
end
