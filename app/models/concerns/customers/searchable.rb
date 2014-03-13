module Customers::Searchable
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order("#{table_name}.name") }

    has_magick_columns name: :string, lastname: :string, identification: :string
  end

  module ClassMethods
    def search query: nil, limit: false
      result = ordered

      if query.present?
        result = magick_search(query)
      end

      limit ? result.limit(10) : result
    end
  end
end
