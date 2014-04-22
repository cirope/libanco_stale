module Loans::Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def search start_date: nil, end_date: nil, limit: false
      parameters, conditions = [], {}

      if start_date.present?
        parameters << "#{table_name}.created_at::date >= :start_date"
        conditions[:start_date] = start_date
      end

      if end_date.present?
        parameters << "#{table_name}.created_at::date <= :end_date"
        conditions[:end_date] = end_date
      end

      result = includes(:customer).where(parameters.join(' AND '), conditions).order(
        "#{table_name}.created_at ASC"
      )

      limit ? result.limit(10) : result
    end
  end
end
