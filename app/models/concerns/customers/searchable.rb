module Customers::Searchable
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order("#{table_name}.name") }
  end

  module ClassMethods
    def search query: nil, limit: false
      result = ordered

      if query.present?
        result = result.where "#{table_name}.name ILIKE ?", "%#{query.strip}%"
      end

      limit ? result.limit(10) : result
    end
  end
end
