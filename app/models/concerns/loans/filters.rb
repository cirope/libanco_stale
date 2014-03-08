module Loans::Filters
  extend ActiveSupport::Concern

  module ClassMethods
    def expired
      where('expired_payments_count > 0')
    end

    def close_to_expire
      where.not(progress: nil)
    end

    def not_renewed
      all
    end
  end
end
