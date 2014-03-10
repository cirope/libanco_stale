module Loans::Filters
  extend ActiveSupport::Concern

  module ClassMethods
    def expired
      joins(:payments).where(
        "#{Payment.table_name}.paid_at IS NULL AND #{Payment.table_name}.expired_at < ?", Date.today
      ).uniq
    end

    def close_to_expire
      joins(:payments).where.not("#{Payment.table_name}.paid_at IS NULL").uniq
    end

    def not_renewed
      joins(:payments).where.not("#{Payment.table_name}.paid_at IS NULL").uniq
    end
  end
end
