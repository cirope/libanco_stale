module Loans::Filters
  extend ActiveSupport::Concern

  module ClassMethods
    def expired
      all
    end

    def close_to_expire
      all
    end

    def not_renewed
      all
    end
  end
end
