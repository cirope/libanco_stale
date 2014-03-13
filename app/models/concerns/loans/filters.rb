module Loans::Filters
  extend ActiveSupport::Concern

  module ClassMethods
    def expired
      current.where(
        'next_payment_expire_at < ?', Date.today
      ).order('next_payment_expire_at DESC')
    end

    def close_to_expire
      current.order('progress DESC')
    end

    def not_renewed
      canceled.order('canceled_at DESC')
    end

    def current
      where(status: 'current')
    end

    def canceled
      where(status: 'canceled')
    end
  end
end
