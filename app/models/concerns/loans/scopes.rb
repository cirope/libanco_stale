module Loans::Scopes
  extend ActiveSupport::Concern

  included do
    scope :search_order, -> {
      order("#{table_name}.created_at ASC, #{table_name}.id ASC")
    }
  end

	module ClassMethods
    def search start_date, end_date
      includes(:customer).where(
        'loans.created_at': start_date.at_beginning_of_day..end_date.at_end_of_day
      ).search_order
    end
  end
end
