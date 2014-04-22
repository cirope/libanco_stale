module Customers::Searchable
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order("#{table_name}.lastname ASC, #{table_name}.name ASC") }

    has_magick_columns name: :string, lastname: :string, identification: :string
  end

  module ClassMethods
    def search query: nil, limit: false
      result = magick_search(query).ordered

      limit ? result.limit(10) : result
    end
  end
end
