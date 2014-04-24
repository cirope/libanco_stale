module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def search start_date: nil, end_date: nil, limit: false
      parameters, conditions = [], {}

      if start_date.present?
        parameters << "#{table_name}.expire_at >= :start_date"
        conditions[:start_date] = start_date.at_beginning_of_day
      end

      if end_date.present?
        parameters << "#{table_name}.expire_at <= :end_date"
        conditions[:end_date] = end_date.at_end_of_day
      end

      result = unscoped.includes(:customer).where(parameters.join(' AND '), conditions).order(
        "#{table_name}.expire_at ASC, #{::Customer.table_name}.lastname"
      ).references(:customer)

      limit ? result.limit(10) : result
    end
  end
end
