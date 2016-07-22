module Payments::Scopes
  extend ActiveSupport::Concern

  included do
    default_scope -> { order("#{table_name}.number ASC") }
    scope :report_order, -> {
      order(
        "#{table_name}.expire_at ASC, #{::Customer.table_name}.lastname ASC, #{table_name}.id ASC"
      ).references(:customer)
    }
  end

	module ClassMethods
    def search start_date, end_date
      unscoped.includes(:customer, :loan).where(
        'payments.created_at': start_date.at_beginning_of_day..end_date.at_end_of_day
      ).report_order
    end
  end
end
