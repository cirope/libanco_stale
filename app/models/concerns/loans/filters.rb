module Loans::Filters
  extend ActiveSupport::Concern

  module ClassMethods
    def expired
      current.joins(:payments).where(
        "#{Payment.table_name}.paid_at IS NULL AND #{Payment.table_name}.expired_at < ?", Date.today
      ).uniq
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
