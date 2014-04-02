module Loans::Filters
  extend ActiveSupport::Concern

  included do
    scope :order_by_expiration, -> { order('expire_at DESC') }
  end

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
      includes(:customer).where(status: 'current')
    end

    def canceled
      includes(:customer).where(status: 'canceled')
    end

    def history
      includes(:customer).where(status: 'history')
    end

    def not_current
      includes(:customer).where.not(status: 'current')
    end

    def private
      joins(:job).where("#{Job.table_name}.kind = ?", 'private')
    end

    def retired
      joins(:job).where("#{Job.table_name}.kind = ?", 'retired')
    end

    def public
      joins(:job).where("#{Job.table_name}.kind = ?", 'public')
    end
  end
end
